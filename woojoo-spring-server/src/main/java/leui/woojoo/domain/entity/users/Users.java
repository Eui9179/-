package leui.woojoo.domain.entity.users;

import jakarta.persistence.*;
import leui.woojoo.domain.BaseTimeEntity;
import leui.woojoo.domain.entity.authority.Authority;
import leui.woojoo.domain.entity.friends.Friends;
import leui.woojoo.domain.entity.user_games.UserGames;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Set;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Users extends BaseTimeEntity {

    @Id
    @Column(name = "id")
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

    @ManyToMany(cascade=CascadeType.ALL)
    @JoinTable(
            name = "user_authority",
            joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "authority_name", referencedColumnName = "authority_name")})
    private Set<Authority> authorities;

    @OneToMany(mappedBy = "users", cascade = CascadeType.ALL)
    private List<Friends> friends;

    @OneToMany(mappedBy = "users", cascade = CascadeType.ALL)
    private List<UserGames> games;

    public void updateProfile(String name, String profileImageName) {
        this.name = name;
        this.profileImageName = profileImageName;
    }

    public void asyncFcmToken(String fcmToken) {
        this.fcmToken = fcmToken;
    }
}
