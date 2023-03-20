package leui.woojoo.domain.user_groups;

import leui.woojoo.domain.entity.user_groups.UserGroups;
import leui.woojoo.domain.entity.user_groups.UserGroupsRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.*;

@SpringBootTest
public class UserDetailGroupsRepositoryTest {

    @Autowired
    private UserGroupsRepository userGroupsRepository;

    @Test
    void UserGroup를_저장하다() {

        //given
        Long userId = 1L;
        String groupName = "인천대학교";
        String detail1 = "4";

        //when
//        UserGroups entity = userGroupsRepository.save(UserGroups.builder()
//                .userId(userId)
//                .groupName(groupName)
//                .detail1(detail1)
//                .build());

        //then
//        assertThat(entity.getId()).isGreaterThan(0L);
//        assertThat(entity.getGroupName()).isEqualTo(groupName);
    }


}
