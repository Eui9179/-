package leui.woojoo.domain.users;

import jakarta.persistence.*;
import leui.woojoo.domain.BaseTimeEntity;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@Entity
public class Users extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(length = 30, nullable = false)
    private String name;

    @Column(length = 20, nullable = false)
    private String phoneNumber;

    @Column(length = 200)
    private String profile_image_name;

    @Column(length = 200)
    private String fcm_token;

}
