package leui.woojoo.domain.entity.friends;

import jakarta.persistence.*;
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
    private Long userId;

    @Column(nullable = false)
    private Long friendsId;

    @Builder
    public Friends(Long userId, Long friendsId) {
        this.userId = userId;
        this.friendsId = friendsId;
    }
}
