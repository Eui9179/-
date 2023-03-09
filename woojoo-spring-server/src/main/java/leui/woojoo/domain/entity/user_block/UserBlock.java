package leui.woojoo.domain.entity.user_block;

import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@Entity
public class UserBlock {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long userId;

    @Column(nullable = false)
    private Long friendId;

    @Builder
    public UserBlock(Long userId, Long friendId) {
        this.userId = userId;
        this.friendId = friendId;
    }
}
