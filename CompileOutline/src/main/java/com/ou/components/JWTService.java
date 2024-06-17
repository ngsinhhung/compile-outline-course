//package com.ou.components;
//
//import com.nimbusds.jose.*;
//import com.nimbusds.jose.crypto.MACSigner;
//import com.nimbusds.jose.crypto.MACVerifier;
//import com.nimbusds.jwt.JWTClaimsSet;
//import com.nimbusds.jwt.SignedJWT;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.PropertySource;
//import org.springframework.core.env.Environment;
//import org.springframework.stereotype.Component;
//
//import java.text.ParseException;
//import java.util.Date;
//
//
//@Component
//@PropertySource("classpath:secretkey.properties")
//public class JWTService {
//
//    @Autowired
//    private static Environment environment;
//
//    private static final String SECRET_KEY = environment.getProperty("SECRET_KEY");
//
//    public static final byte[] SHARED_SECRET_KEY = SECRET_KEY.getBytes();
//    public static final int EXPIRE_TIME = 86400000;
//
//    public String generateTokenLogin(String username) {
//        String token = null;
//        try {
//            JWSSigner signer = new MACSigner(SHARED_SECRET_KEY);
//
//            JWTClaimsSet.Builder builder = new JWTClaimsSet.Builder();
//            builder.claim("username", username);
//
//            builder.expirationTime(new Date(System.currentTimeMillis() + EXPIRE_TIME));
//
//            JWTClaimsSet claimsSet = builder.build();
//            SignedJWT signedJWT = new SignedJWT(new JWSHeader(JWSAlgorithm.HS256), claimsSet);
//
//            signedJWT.sign(signer);
//            token = signedJWT.serialize();
//        } catch (JOSEException e) {
//            System.out.println(e.getMessage());
//        }
//        return token;
//    }
//
//    private JWTClaimsSet getClaimsFromToken(String token) {
//        JWTClaimsSet claims = null;
//        try {
//            SignedJWT signedJWT = SignedJWT.parse(token);
//            JWSVerifier verifier = new MACVerifier(SHARED_SECRET_KEY);
//            if (signedJWT.verify(verifier)) {
//                claims = signedJWT.getJWTClaimsSet();
//            }
//        } catch (JOSEException | ParseException e) {
//            System.err.println(e.getMessage());
//        }
//        return claims;
//    }
//
//    private Date getExpirationDateFromToken(String token) {
//        JWTClaimsSet claims = getClaimsFromToken(token);
//        Date expiration = claims.getExpirationTime();
//        return expiration;
//    }
//
//    public String getUsernameFromToken(String token) {
//        String username = null;
//        try {
//            JWTClaimsSet claims = getClaimsFromToken(token);
//            username = claims.getStringClaim("username");
//        } catch (ParseException e) {
//            System.err.println(e.getMessage());
//        }
//        return username;
//    }
//
//    private Boolean isTokenExpired(String token) {
//        Date expiration = getExpirationDateFromToken(token);
//        return expiration.before(new Date());
//    }
//
//    public Boolean validateTokenLogin(String token) {
//        if (token == null || token.trim().length() == 0) {
//            return false;
//        }
//        String username = getUsernameFromToken(token);
//
//        return !(username == null || username.isEmpty() || isTokenExpired(token));
//    }
//}
