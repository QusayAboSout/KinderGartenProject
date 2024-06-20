using Domain.DTOs.User;
using Domain.Models;
using Domain.Models.UserModels;
using Domain.Models.UserVerificationCodeModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using TanvirArjel.Extensions.Microsoft.DependencyInjection;

namespace Domain.IServices
{
    [ScopedService]
    public interface IUserServices : IGeneralService<User>
    {
        Task<bool> ForceChangePassword(ForceChangePasswordDto changePasswordDto);
        Task<bool> ResetPassword(ClaimsPrincipal userPrincipal);
        // Task<UserDto> AddUser(UserDto addUserDto);
        // Task<UserDto> UpdateUser(UserDto userDto);
        // Task<bool> ChangePassword(ChangeProfilePasswordDto changePasswordDto, ClaimsPrincipal userPrincipal);
        // Task<PaginationResult<UserViewDto>> GetAllWithSearch(UserFilter userFilter);
        // Task<UserProfileDto> GetUserProfile(ClaimsPrincipal user);
        // Task<PersonProfileEditDto> UpdatePersonProfile(PersonProfileEditDto userDto, ClaimsPrincipal user);
        // Task<UserVerificationCodeResult> SendVerificationCodeForChangePassword(ChangeProfilePasswordDto changePasswordDto, ClaimsPrincipal user);
        PasswordDto HandelPassword(UserDto addUserDto, User user);
    }
}
