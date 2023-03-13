package leui.woojoo.domain.entity.friends;

import leui.woojoo.domain.entity.users.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FriendsRepository extends JpaRepository<Friends, Long> {
    List<Friends> findFriendsByUsers(Users users);
}
