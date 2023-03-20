package leui.woojoo.service.user_games;

import leui.woojoo.domain.entity.user_games.UserGamesRepository;
import leui.woojoo.domain.entity.user_games.dto.UserGamesByUserIdDto;
import leui.woojoo.domain.users.dto.web.profile.user_profile_request.UserGame;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class UserGamesService {
    private final UserGamesRepository userGamesRepository;

    public List<UserGame> findUserGamesByUserId(Long userId) {
        List<UserGamesByUserIdDto> userGames = userGamesRepository.findUserGamesByUserId(userId);
        return userGames.stream()
                .map(userGame -> new UserGame(userGame.getGameName(), userGame.getGameNickname()))
                .toList();
    }
}
