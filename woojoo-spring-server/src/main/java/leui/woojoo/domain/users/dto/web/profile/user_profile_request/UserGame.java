package leui.woojoo.domain.users.dto.web.profile.user_profile_request;

import leui.woojoo.domain.entity.user_games.UserGames;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserGame {
    private String game;
    private String nickname;

    public UserGame(UserGames games) {
        this.game  = games.getGameName();
        this.nickname = games.getGameNickname();
    }

}
