package leui.woojoo.domain.friends.entity;

import leui.woojoo.domain.users.entity.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FriendsRepository extends JpaRepository<Friends, Long> {
    List<Friends> findFriendsByUsers(Users users);
}
