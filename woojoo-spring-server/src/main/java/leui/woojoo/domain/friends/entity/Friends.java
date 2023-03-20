package leui.woojoo.domain.friends.entity;

import jakarta.persistence.*;
import leui.woojoo.domain.users.entity.Users;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@Entity
public class Friends {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long friendsId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Users users;

    @Builder
    public Friends(Long userId, Long friendsId) {
        this.friendsId = friendsId;
    }
}
