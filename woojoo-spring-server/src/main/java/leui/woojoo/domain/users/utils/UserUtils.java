package leui.woojoo.domain.users.utils;

import org.springframework.security.core.userdetails.User;

public class UserUtils {
    public static Long resolveUserId(User user) {
        return Long.parseLong(user.getUsername());
    }
}
