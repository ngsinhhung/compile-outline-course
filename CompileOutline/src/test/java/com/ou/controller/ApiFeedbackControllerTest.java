package com.ou.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ou.controllers.ApiFeedbackController;
import com.ou.pojo.Feedback;
import com.ou.pojo.User;
import com.ou.services.UserService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.mockito.BDDMockito.given;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
//@SpringBootTest
@WebMvcTest(ApiFeedbackController.class)
public class ApiFeedbackControllerTest {
    private MockMvc mockMvc;
    @Autowired
    private WebApplicationContext context;
    @MockBean
    private UserService userService;

    ObjectMapper mapper = new ObjectMapper();

    @Before
    public void setup(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testGetFeedbackSuccess() throws Exception {
        User user = new User();
        given(userService.getCurrentUser()).willReturn(user);
        Feedback feedback = new Feedback();
        feedback.setContent("đề cương hay quá");
        feedback.setStarts(Float.parseFloat("4.5"));
        String jsonRequest = mapper.writeValueAsString(feedback);

        MvcResult result = mockMvc.perform(post("/api/feedback/1").content(jsonRequest).contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(status().isOk()).andReturn();
        String resultString = result.getResponse().getContentAsString();

        ResponseEntity<Object> rs = mapper.readValue(resultString, new TypeReference<ResponseEntity<Object>>() {}); // Use TypeReference for ResponseEntity

        Assert.assertTrue(rs.getStatusCode().is2xxSuccessful());
    }
}
