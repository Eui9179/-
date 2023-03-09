package leui.woojoo.domain.entity.today_games;

import jakarta.persistence.*;
import leui.woojoo.domain.BaseTimeEntity;
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

    @Column(nullable = false)
    private Long userId;

    @Column(length = 40, nullable = false)
    private String gameName;

    @Column(columnDefinition = "TEXT")
    private String descriptions;

    @Builder
    public TodayGames(Long userId, String gameName, String descriptions) {
        this.userId = userId;
        this.gameName = gameName;
        this.descriptions = descriptions;
    }
}
