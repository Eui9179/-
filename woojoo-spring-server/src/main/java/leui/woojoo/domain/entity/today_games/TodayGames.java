package leui.woojoo.domain.entity.today_games;

import jakarta.persistence.*;
import leui.woojoo.domain.BaseTimeEntity;
import leui.woojoo.domain.users.entity.Users;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@Entity
public class TodayGames extends BaseTimeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

//    @Column(nullable = false)
//    private Long userId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users users;

    @Column(length = 40, nullable = false)
    private String gameName;

    @Column(columnDefinition = "TEXT")
    private String descriptions;

    @Builder
    public TodayGames(Users users, String gameName, String descriptions) {
        this.users = users;
        this.gameName = gameName;
        this.descriptions = descriptions;
    }
}
