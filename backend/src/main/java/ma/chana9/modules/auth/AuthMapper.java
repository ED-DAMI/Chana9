package ma.chana9.modules.auth;

import ma.chana9.modules.auth.dto.RegisterRequest;
import ma.chana9.modules.user.User;
import ma.chana9.modules.user.dto.UserDTO;
import ma.chana9.shared.config.MapperConfig;
import ma.chana9.shared.enums.Role;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;

@Mapper(config = MapperConfig.class)
public interface AuthMapper {

    @Mapping(target = "id",             source = "id")
    @Mapping(target = "phone",          source = "phone")
    @Mapping(target = "fullName",       source = "fullName")
    @Mapping(target = "role",           source = "role")
    @Mapping(target = "kycVerified",    source = "kycVerified")
    @Mapping(target = "kycSubmittedAt", source = "kycSubmittedAt")
    @Mapping(target = "createdAt",      source = "createdAt")
    @Mapping(target = "updatedAt",      source = "updatedAt")
    UserDTO toUserDTO(User user);

    @Mapping(target = "id",             ignore = true)
    @Mapping(target = "phone",          source = "request.phone")
    @Mapping(target = "fullName",       source = "request", qualifiedByName = "resolveFullName")
    @Mapping(target = "passwordHash",   source = "passwordHash")
    @Mapping(target = "role",           expression = "java(Role.ACHETEUR)")
    @Mapping(target = "kycVerified",    constant = "false")
    @Mapping(target = "kycSubmittedAt", ignore = true)
    @Mapping(target = "createdAt",      ignore = true)
    @Mapping(target = "updatedAt",      ignore = true)
    User toUser(RegisterRequest request, String passwordHash);

    @Named("resolveFullName")
    default String resolveFullName(RegisterRequest request) {
        return request.fullName() != null ? request.fullName() : request.phone();
    }
}