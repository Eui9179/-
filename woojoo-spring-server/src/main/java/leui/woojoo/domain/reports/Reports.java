package leui.woojoo.domain.reports;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@Entity
public class Reports {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long userId;

    private Long reportedUserId;

    private Integer reportNumbers;

    @Builder
    public Reports(Long userId, Long reportedUserId, Integer reportNumbers) {
        this.userId = userId;
        this.reportedUserId = reportedUserId;
        this.reportNumbers = reportNumbers;
    }
}
