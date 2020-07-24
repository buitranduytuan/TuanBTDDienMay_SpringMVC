/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tuanbtd.com.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import tuanbtd.com.entity.ThanhVien;
import tuanbtd.com.service.ThanhVienService;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private ThanhVienService thanhVienService;

    @Override
    public Authentication authenticate(Authentication a) throws AuthenticationException {
        String username = a.getName().trim();
        String password = a.getCredentials().toString().trim();
        if (!StringUtils.isEmpty(username) && !StringUtils.isEmpty(password)) {
            ThanhVien thanhVien = thanhVienService.getThanhVienByUsernameAndPassword(username, password);
            if (thanhVien != null && thanhVien.getMaThanhVien() > 0 && thanhVien.isEnabled()) {

                List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();

                GrantedAuthority role = new SimpleGrantedAuthority(thanhVien.getRole().toString().trim());
                roles.add(role);

                return new UsernamePasswordAuthenticationToken(thanhVien, thanhVien.getUsername(), roles);
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    @Override
    public boolean supports(Class<?> type) {
        return type.equals(UsernamePasswordAuthenticationToken.class);
    }

}
