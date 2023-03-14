package leui.woojoo.domain.entity.user_games;

import jakarta.persistence.*;
import leui.woojoo.domain.entity.users.Users;
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

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users users;

    @Column(length = 50, nullable = false)
    private String gameName;

    @Column(length = 30, nullable = false)
    private String gameNickname;

    @Builder
    public UserGames(Users users, String gameName, String gameNickname) {
        this.users = users;
        this.gameName = gameName;
        this.gameNickname = gameNickname;
    }

    public void updateGameNickname(String gameNickname) {
        this.gameNickname = gameNickname;
    }
}
