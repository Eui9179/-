package leui.woojoo.domain.user_groups.entity;

import jakarta.persistence.*;
import leui.woojoo.domain.users.entity.Users;
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

    @OneToOne
    @JoinColumn(name = "user_id")
    private Users users;

    @Column(length = 30, nullable = false)
    private String groupName;

    @Column(length = 30, nullable = false)
    private String detail1;

    @Builder
    public UserGroups(Users users, String groupName, String detail1) {
        this.users = users;
        this.groupName = groupName;
        this.detail1 = detail1;
    }

    public void update(String groupName, String detail1) {
        this.groupName = groupName;
        this.detail1 = detail1;
    }
}
