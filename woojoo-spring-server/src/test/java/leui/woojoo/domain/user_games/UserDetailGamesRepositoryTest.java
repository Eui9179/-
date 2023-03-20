package leui.woojoo.domain.user_games;

import leui.woojoo.domain.user_games.entity.UserGames;
import leui.woojoo.domain.user_games.entity.UserGamesRepository;
import leui.woojoo.domain.users.entity.Users;
import leui.woojoo.domain.users.entity.UsersRepository;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class UserDetailGamesRepositoryTest {

    @Autowired
    private UserGamesRepository userGamesRepository;

    @Autowired
    private UsersRepository usersRepository;

    @AfterEach
    void cleanUp() {
        userGamesRepository.deleteAll();
    }

    @Test
    void  user_game을_데이터베이스에_저장하다() {
        //given
        Users userEntity = usersRepository.save(Users.builder()
                .name("test")
                .phoneNumber("+1026649179")
                .profileImageName("default.png")
                .fcmToken("1234")
                .build());

        String gameName = "leagueoflegneds";
        String gameNickname = "Lee";

        //when
        UserGames userGamesEntity = userGamesRepository.save(UserGames.builder()
                .users(userEntity)
                .gameName(gameName)
                .gameNickname(gameNickname)
                .build());

        //then
        Assertions.assertThat(userGamesEntity.getUsers().getId()).isEqualTo(userEntity.getId());
        Assertions.assertThat(userGamesEntity.getGameName()).isEqualTo(gameName);
    }

}
