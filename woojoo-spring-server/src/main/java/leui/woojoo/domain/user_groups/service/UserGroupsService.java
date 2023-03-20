package leui.woojoo.domain.user_groups.service;

import leui.woojoo.domain.user_groups.entity.UserGroups;
import leui.woojoo.domain.user_groups.entity.UserGroupsRepository;
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
