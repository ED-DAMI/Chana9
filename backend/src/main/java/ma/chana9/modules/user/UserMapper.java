package ma.chana9.modules.user;


import ma.chana9.modules.user.dto.UserDTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface UserMapper {
    @Mapping(target = "active", source = "active")
    UserDTO toDto(User user);
}