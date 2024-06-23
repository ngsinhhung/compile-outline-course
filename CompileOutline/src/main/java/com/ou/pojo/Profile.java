package com.ou.pojo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "profile")
public class Profile {
    @Id
    @Column(name = "user_id", nullable = false)
    private Integer id;

    @MapsId
    @OneToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "fullname", length = 45)
    private String fullname;

    @Column(name = "email", nullable = false, length = 45)
    @Email(message = "Địa chỉ Email không hợp lệ")
    @NotEmpty(message = "Vui Lòng nhập email")
    private String email;

    @Column(name = "avatar", length = 100)
    private String avatar;

    @Column(name = "date_joined")
    private LocalDate dateJoined;

    @Column(name = "phone", length = 15)
    private String phone;

    @Column(name = "gender")
    private Boolean gender;

    @Transient
    @Valid
    @NotNull(message = "Vui lòng upload ảnh")
    private MultipartFile file;

    public void setFile(MultipartFile file) throws Exception {
        if (file == null || file.isEmpty()) {
            throw new Exception("Vui lòng upload ảnh");
        }
        this.file = file;
    }
}