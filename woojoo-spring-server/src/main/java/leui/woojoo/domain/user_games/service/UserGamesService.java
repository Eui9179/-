package leui.woojoo.domain.user_games.service;

import leui.woojoo.domain.user_games.entity.UserGamesRepository;
import leui.woojoo.domain.user_games.dto.repository.UserGamesByUserIdDto;
import leui.woojoo.domain.user_games.dto.UserGame;
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
