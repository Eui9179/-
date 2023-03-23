from flask import Blueprint

from flask_jwt_extended import get_jwt_identity, jwt_required
from woojoo.entity.friends import Block, Friends
from woojoo.entity.games import UserGames
from woojoo.entity.groups import UserGroups
from woojoo.entity.user import User
from woojoo.utils.common import response_json_with_code
from woojoo import db
from operator import itemgetter

group_bp = Blueprint("group", __name__, url_prefix="/api/user/groups")

groups = [
    "상일초등학교",
    "상일중학교",
    "상원고등학교",
    "상원초등학교",
    "석천초등학교",
    "석천중학교",
    "부천정보산업고등학교",
    "상동초등학교",
]


@group_bp.route('/me', methods=["GET"])
@jwt_required()
def get_my_groups():
    user_id = get_jwt_identity();
    group_rows = UserGroups.get_groups_by_user_id(user_id)
    my_groups = []
    for group in group_rows:
        my_groups.append({
            "name": group.name,
            "detail1": group.detail1
        })

    my_groups.sort()

    return response_json_with_code(my_groups=my_groups)


@group_bp.route('/<name>', methods=['GET'])
@jwt_required()
def get_people_by_group(name):
    user_id = get_jwt_identity()
    my_game_rows = UserGames.get_games_by_user_id(user_id)
    my_games = [my_game.game for my_game in my_game_rows]

    my_friend_rows = Friends.get_friends_by_user_id(user_id)
    my_friends = [my_friend.friend_id for my_friend in my_friend_rows]

    my_block_rows = Block.get_block_by_user_id(user_id)
    my_block_user_ids = [my_block.friend_id for my_block in my_block_rows]

    group_rows = db.engine.execute(
        f'SELECT * FROM user WHERE id IN \
            (SELECT user_id FROM user_groups WHERE name="{name}");'
    )

    # 내 친구 목록의 친구 id와 User테이블, Game테이블 조인
    people = []
    friends = []

    for row in group_rows:
        if (row.id not in my_block_user_ids):
            friend_game_rows = UserGames.get_games_by_user_id(row.id)
            friend_games = [friend.game for friend in friend_game_rows]
            intersection = list(set(my_games).intersection(friend_games))
            if row.id != user_id:
                if not row.id in my_friends:
                    people.append({
                        "id": row.id,
                        "name": row.name,
                        "profile_image_name": row.profile_image_name,
                        "games": intersection,
                    })
                else:

                    friends.append({
                        "id": row.id,
                        "name": row.name,
                        "profile_image_name": row.profile_image_name,
                        "games": intersection,
                    })

    sorted_people = sorted(people, key=itemgetter('name'))
    sorted_friends = sorted(friends, key=itemgetter('name'))

    return response_json_with_code(people=sorted_people, friends=sorted_friends)


@group_bp.route('/<name>/<detail1>', methods=['GET'])
@jwt_required()
def get_people_by_group_detail1(name, detail1):
    user_id = get_jwt_identity()
    my_game_rows = UserGames.get_games_by_user_id(user_id)
    my_games = [my_game.game for my_game in my_game_rows]

    my_friend_rows = Friends.get_friends_by_user_id(user_id)
    my_friends = [my_friend.friend_id for my_friend in my_friend_rows]

    my_block_rows = Block.get_block_by_user_id(user_id)
    my_block_user_ids = [my_block.friend_id for my_block in my_block_rows]

    group_rows = User.get_user_in_group(name, detail1)

    # 내 친구 목록의 친구 id와 User테이블, Game테이블 조인
    people = []
    friends = []

    for row in group_rows:
        if (row.id not in my_block_user_ids):
            friend_game_rows = UserGames.get_games_by_user_id(row.id)
            friend_games = [friend.game for friend in friend_game_rows]
            intersection = list(set(my_games).intersection(friend_games))
            if row.id != user_id:
                if not row.id in my_friends:
                    people.append({
                        "id": row.id,
                        "name": row.name,
                        "profile_image_name": row.profile_image_name,
                        "games": intersection,
                    })
                else:
                    friends.append({
                        "id": row.id,
                        "name": row.name,
                        "profile_image_name": row.profile_image_name,
                        "games": intersection,
                    })

    sorted_people = sorted(people, key=itemgetter('name'))
    sorted_friends = sorted(friends, key=itemgetter('name'))

    return response_json_with_code(people=sorted_people, friends=sorted_friends)
