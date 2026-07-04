package ma.chana9.modules.annonce;

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
@RequestMapping(ApiPaths.Annonces.BASE)
public class AnnonceController {

	private final AnnonceService annonceService;
	private final MessageResolver messageResolver;

	@PostMapping
	public ApiResponse<Annonce> create(@Valid @RequestBody Annonce annonce) {
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), annonceService.create(annonce));
	}

	@GetMapping
	public ApiResponse<List<Annonce>> list() {
		return ApiResponse.success(messageResolver.resolve(MessageKeys.DEFAULT), annonceService.findAll());
	}
}
