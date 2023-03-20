package leui.woojoo.domain.friends.service;

import leui.woojoo.domain.friends.entity.FriendsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class FriendsService {
    private final FriendsRepository friendsRepository;
}
