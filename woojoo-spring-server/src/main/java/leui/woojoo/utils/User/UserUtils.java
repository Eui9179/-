package leui.woojoo.utils.User;

import org.springframework.security.core.userdetails.User;

public class UserUtils {
    public static Long resolveUserId(User user) {
        return Long.parseLong(user.getUsername());
    }
}
