from flask import Blueprint


from flask import request
from flask_jwt_extended import get_jwt_identity, jwt_required
from woojoo import db
from woojoo.entity.friends import Block, Friends
from woojoo.entity.games import UserGames
from woojoo.entity.user import User
from woojoo.utils.common import response_json_with_code
from operator import itemgetter
import random

f_bp = Blueprint("friends", __name__, url_prefix="/api/user")

games = [
    "leagueoflegends",
    "fifaonline4",
    "battleground",
    "suddenattack",
    "lostark",
    "minecraft",
    "valorant",
    "maplestory",
    "tft",
    "overwatch",
    "starcraft",
    "starcraft2",
    "hearthstone",
    "dungeonandfighter",
]

@f_bp.route('friends/me', methods=["GET"])
@jwt_required()
def get_my_friends():
    user_id = get_jwt_identity()

    my_game_rows = UserGames.get_games_by_user_id(user_id)
    my_games = [my_game.game for my_game in my_game_rows]

    friend_rows = User.get_user_friends(user_id)

    # 내 친구 목록의 친구 id와 User테이블, Game테이블 조인
    my_friends = []
    for friend in friend_rows:
        friend_game_rows = UserGames.get_games_by_user_id(friend.id)
        friend_games = [friend.game for friend in friend_game_rows]
        intersection = list(set(my_games).intersection(friend_games))

        my_friends.append({
            "id": friend.id,
            "name": friend.name,
            "profile_image_name": friend.profile_image_name,
            "games": intersection,
        })

    sortedlist = sorted(my_friends, key=itemgetter('name'))
    return response_json_with_code(my_friends=sortedlist)


@f_bp.route('friends/sync', methods=["POST"])
@jwt_required()
def sync_friend():
    phone_numbers = request.get_json()
    user_id = get_jwt_identity()

    my_friends = Friends.get_friends_by_user_id(user_id)

    for phone_number in phone_numbers:
        friend_row = User.get_user_by_phone_number(phone_number)
        if friend_row:
            if not friend_row.id in my_friends:
                db.session.add(Friends(
                    user_id=user_id,
                    friend_id=friend_row.id,
                ))

    db.session.commit()
    return response_json_with_code()


@f_bp.route('friends', methods=["POST"])
@jwt_required()
def insert_many_friends():
    user_id = get_jwt_identity()
    friends = request.get_json()

    for friend_id in friends:
        db.session.add(Friends(
            user_id=user_id,
            friend_id=friend_id,
        ))

    db.session.commit()

    my_game_rows = UserGames.get_games_by_user_id(user_id)
    my_games = [my_game.game for my_game in my_game_rows]

    # 내 친구 목록의 친구 id와 User테이블, Game테이블 조인
    my_friends = []

    for friend_id in friends:
        friend_row = User.get_user_by_id(friend_id);
        friend_game_rows = UserGames.get_games_by_user_id(friend_id)
        friend_games = [friend.game for friend in friend_game_rows]
        intersection = list(set(my_games).intersection(friend_games))

        my_friends.append({
            "id": friend_row.id,
            "name": friend_row.name,
            "profile_image_name": friend_row.profile_image_name,
            "games": intersection,
        })
    sortedlist = sorted(my_friends, key=itemgetter('name'))
    return response_json_with_code(new_friends=sortedlist)


@f_bp.route('friend', methods=["POST"])
@jwt_required()
def insert_friend():
    '''
    친구 한명 추가
    '''
    user_id = get_jwt_identity()
    friend_id = request.get_json()['friend_id']

    friend_row = Friends.get_friend_one(user_id=user_id, friend_id=friend_id)

    if not friend_row:
        db.session.add(Friends(
            user_id=user_id,
            friend_id=friend_id,
        ))

        db.session.commit()

        my_game_rows = UserGames.get_games_by_user_id(user_id)
        my_games = [my_game.game for my_game in my_game_rows]

        friend_row = User.get_user_by_id(friend_id);
        friend_game_rows = UserGames.get_games_by_user_id(friend_id)
        friend_games = [friend.game for friend in friend_game_rows]
        intersection = list(set(my_games).intersection(friend_games))

        return response_json_with_code(new_friend={
            "id": friend_row.id,
            "name": friend_row.name,
            "profile_image_name": friend_row.profile_image_name,
            "games": intersection,
        })
    else:
        return response_json_with_code(res_code=409)


@f_bp.route('friend/<int:friend_id>', methods=["DELETE"])
@jwt_required()
def delete_friend(friend_id):
    print(friend_id)
    user_id = get_jwt_identity()

    Friends.query.filter(
        (Friends.user_id == user_id) & (Friends.friend_id == friend_id)
    ).delete()

    db.session.commit()

    return response_json_with_code()


@f_bp.route('/block', methods=["POST"])
@jwt_required()
def block_friend():
    user_id = get_jwt_identity()
    friend_id = request.get_json()['friend_id']

    block_row = Block.get_block_one(user_id, friend_id)
    if block_row:
        return response_json_with_code(res_code=409)

    Friends.query.filter(
        (Friends.user_id == user_id) & (Friends.friend_id == friend_id)
    ).delete()

    db.session.commit()
    Block.insert_block(user_id, friend_id)

    return response_json_with_code()
