package ma.chana9.modules.messaging;

import java.util.List;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import ma.chana9.shared.constants.ApiPaths;
import ma.chana9.shared.constants.MessageKeys;
import ma.chana9.shared.i18n.MessageResolver;
import ma.chana9.shared.response.ApiResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping(ApiPaths.Messages.BASE)
public class MessageController {

	private final MessageService messageService;
	private final MessageResolver messageResolver;

	@PostMapping
	public ApiResponse<Message> send(@Valid @RequestBody Message message) {
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), messageService.send(message));
	}

	@GetMapping
	public ApiResponse<List<Message>> list() {
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), messageService.findAll());
	}
}
