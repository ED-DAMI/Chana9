package ma.chana9.modules.sequestre;

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
@RequestMapping(ApiPaths.Sequestres.BASE)
public class SequestreController {

	private final SequestreService sequestreService;
	private final MessageResolver messageResolver;

	@PostMapping
	public ApiResponse<Sequestre> create(@Valid @RequestBody Sequestre sequestre) {
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), sequestreService.create(sequestre));
	}

	@GetMapping
	public ApiResponse<List<Sequestre>> list() {
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), sequestreService.findAll());
	}
}
