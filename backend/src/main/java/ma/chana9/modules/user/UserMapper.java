package ma.chana9.modules.user;

import ma.chana9.modules.auth.dto.RegisterRequest;
import ma.chana9.modules.user.dto.UserDTO;
import ma.chana9.shared.config.MapperConfig;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

@Mapper(config = MapperConfig.class)
public interface UserMapper {

    @Mapping(target = "id",              source = "id")
    @Mapping(target = "phone",           source = "phone")
    @Mapping(target = "fullName",        source = "fullName")
    @Mapping(target = "role",            source = "role")
    @Mapping(target = "kycVerified",     source = "kycVerified")
    @Mapping(target = "profilePhotoUrl", source = "profilePhotoUrl")
    @Mapping(target = "region",          source = "region")
    @Mapping(target = "active",          source = "active")
    @Mapping(target = "createdAt",       source = "createdAt")
    UserDTO toDto(User user);

    @Mapping(target = "id",              ignore = true)
    @Mapping(target = "phone",           source = "request.phone")
    @Mapping(target = "fullName",        source = "request", qualifiedByName = "resolveFullName")
    @Mapping(target = "passwordHash",    source = "passwordHash")
    @Mapping(target = "role",            expression = "java(Role.USER)")
    @Mapping(target = "kycVerified",     constant = "false")
    @Mapping(target = "kycSubmittedAt",  ignore = true)
    @Mapping(target = "profilePhotoUrl", ignore = true)
    @Mapping(target = "region",          ignore = true)
    @Mapping(target = "active",          ignore = true)
    @Mapping(target = "createdAt",       ignore = true)
    @Mapping(target = "updatedAt",       ignore = true)
    User toUser(RegisterRequest request, String passwordHash);

    @Named("resolveFullName")
    default String resolveFullName(RegisterRequest request) {
        return request.fullName() != null ? request.fullName() : request.phone();
    }
}