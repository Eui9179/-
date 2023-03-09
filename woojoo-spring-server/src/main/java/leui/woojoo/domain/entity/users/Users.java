package leui.woojoo.domain.entity.users;

import jakarta.persistence.*;
import leui.woojoo.domain.BaseTimeEntity;
import lombok.Builder;
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
    private String profileImageName;

    @Column(length = 200)
    private String fcmToken;

    @Builder
    public Users(String name, String phoneNumber, String profileImageName, String fcmToken) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.profileImageName = profileImageName;
        this.fcmToken = fcmToken;
    }

    public void updateProfile(String name, String profileImageName) {
        this.name = name;
        this.profileImageName = profileImageName;
    }

    public void updateFcmToken(String fcmToken) {
        this.fcmToken = fcmToken;
    }
}
