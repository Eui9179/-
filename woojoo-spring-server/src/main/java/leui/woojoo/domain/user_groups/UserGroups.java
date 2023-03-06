package leui.woojoo.domain.user_groups;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@Entity
public class UserGroups {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long userId;

    @Column(length = 30, nullable = false)
    private String groupName;

    @Column(length = 30, nullable = false)
    private String detail1;

    @Builder
    public UserGroups(Long userId, String groupName, String detail1) {
        this.userId = userId;
        this.groupName = groupName;
        this.detail1 = detail1;
    }

    public void update(String groupName, String detail1) {
        this.groupName = groupName;
        this.detail1 = detail1;
    }
}
