package leui.woojoo.domain.entity.users;

import leui.woojoo.domain.entity.users.dto.UserFriendsWithUsersDto;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface UsersRepository extends JpaRepository<Users, Long> {
    Optional<Users> findByPhoneNumber(String phoneNumber);

    @EntityGraph(attributePaths = "authorities")
    Optional<Users> findOneWithAuthoritiesById(Long userId);

    @Query(value = "select u.id as id, u.name as name, u.profile_image_name as profileImageName "
            + "from friends as f "
            + "inner join users as u "
            + "on f.friends_id=u.id and f.user_id=:userId",
            nativeQuery = true)
    List<UserFriendsWithUsersDto> findFriendsWithUsers(@Param("userId") Long userId);
}
