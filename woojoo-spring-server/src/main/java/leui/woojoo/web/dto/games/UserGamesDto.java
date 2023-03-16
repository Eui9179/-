package leui.woojoo.web.dto.games;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import leui.woojoo.domain.entity.user_games.UserGames;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
public class UserGamesDto {
    private String gameName;
    private String gameNickname;

    public UserGamesDto(UserGames games) {
        this.gameName = games.getGameName();
        this.gameNickname = games.getGameNickname();
    }
}
