package leui.woojoo.config;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Base64;

@Component
public class JWTProvider {
    @Value("${jwt.password}")
    private String SEC_KEY;

    public String createToken(String userId) {
        Algorithm algorithm = Algorithm.HMAC256(Base64.getDecoder().decode(SEC_KEY));
        return JWT.create()
                .withSubject(userId)
                .sign(algorithm);
    }

    public VerifyResult verifyJwt(String token) {
        String userId;
        Algorithm algorithm  = Algorithm.HMAC256(Base64.getDecoder().decode(SEC_KEY));
        try {
            userId = JWT.require(algorithm)
                    .build()
                    .verify(removeBearer(token))
                    .getSubject();

            return VerifyResult.builder()
                    .userId(Long.parseLong(userId))
                    .success(true)
                    .build();

        } catch (Exception ex) {
            userId = JWT.decode(token).getSubject();
            return VerifyResult.builder()
                    .userId(Long.parseLong(userId))
                    .success(false)
                    .build();
        }
    }

    private String removeBearer(String token) {
        return token.substring("Bearer ".length());
    }
}
