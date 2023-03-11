package leui.woojoo.service.user_groups;

import leui.woojoo.domain.entity.user_groups.UserGroups;
import leui.woojoo.domain.entity.user_groups.UserGroupsRepository;
import leui.woojoo.web.dto.groups.SignupGroupsParam;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class UserGroupsService {

    private final UserGroupsRepository userGroupsRepository;

    public Long save(UserGroups userGroups) {

        return userGroupsRepository.save(userGroups).getId();
    }
}
