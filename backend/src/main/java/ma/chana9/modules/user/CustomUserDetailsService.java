package ma.chana9.modules.user;

import lombok.RequiredArgsConstructor;
import ma.chana9.shared.constants.ErrorKeys;
import ma.chana9.shared.security.AppUserDetails;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String phone) throws UsernameNotFoundException {
        return userRepository.findByPhone(phone)
                .map(AppUserDetails::new)
                .orElseThrow(() -> new UsernameNotFoundException(ErrorKeys.Auth.PHONE_NOT_FOUND));
    }
}