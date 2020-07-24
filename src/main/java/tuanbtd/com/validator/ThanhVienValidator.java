package tuanbtd.com.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import tuanbtd.com.entity.ThanhVien;

public class ThanhVienValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return ThanhVien.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ThanhVien thanhVien = (ThanhVien) target;
        if(thanhVien.getUsername().length()==0 ||thanhVien.getUsername()==null) {
            errors.rejectValue("username", "field.username");
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "hoTen", "field.hoTen");
        
        if(thanhVien.getPassword().length()<6||thanhVien.getPassword()==null ) {
            errors.rejectValue("password", "field.password");
        }
    }

}
