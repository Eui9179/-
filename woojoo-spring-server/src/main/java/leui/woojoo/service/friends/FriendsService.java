package leui.woojoo.service.friends;

import leui.woojoo.domain.entity.friends.Friends;
import leui.woojoo.domain.entity.friends.FriendsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
public class FriendsService {
    private final FriendsRepository friendsRepository;
}
