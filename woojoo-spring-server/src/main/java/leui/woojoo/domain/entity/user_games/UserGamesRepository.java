package leui.woojoo.domain.entity.user_games;

import leui.woojoo.domain.entity.user_games.dto.UserGamesByUserIdDto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserGamesRepository extends JpaRepository<UserGames, Long> {
    @Query(value = "select game_name as gameName, game_nickname as gameNickname "
            + "from user_games "
            + "where user_id=:userId",
            nativeQuery = true)
    List<UserGamesByUserIdDto> findUserGamesByUserId(@Param("userId") Long userId);
}
