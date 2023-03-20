package leui.woojoo.domain.user_games.dto;

import leui.woojoo.domain.user_games.entity.UserGames;
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
