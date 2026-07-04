package ma.chana9.modules.user;

import java.util.List;

import lombok.RequiredArgsConstructor;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.constants.MessageKeys;
import ma.chana9.shared.i18n.MessageResolver;
import ma.chana9.shared.response.ApiResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping(ApiPaths.Users.BASE)
public class UserController {

	private final UserService userService;
	private final MessageResolver messageResolver;

	@GetMapping
	public ApiResponse<List<User>> list() {
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), userService.findAll());
	}
}
