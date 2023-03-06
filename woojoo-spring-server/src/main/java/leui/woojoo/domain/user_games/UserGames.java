package leui.woojoo.domain.user_games;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@Entity
public class UserGames {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long userId;

    @Column(length = 50, nullable = false)
    private String gameName;

    @Column(length = 30, nullable = false)
    private String gameNickname;

    @Builder
    public UserGames(Long userId, String gameName, String gameNickname) {
        this.userId = userId;
        this.gameName = gameName;
        this.gameNickname = gameNickname;
    }

    public void updateGameNickname(String gameNickname) {
        this.gameNickname = gameNickname;
    }
}
