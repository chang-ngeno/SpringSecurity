package ke.go.kra.itax.chang;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import ke.go.kra.itax.chang.model.User;
import ke.go.kra.itax.chang.repo.RoleRepo;
import ke.go.kra.itax.chang.repo.UserRepo;
import ke.go.kra.itax.chang.service.UserService;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.junit.Assert.assertEquals;

public class UserServiceTest {

	@Mock
	private UserRepo mockUserRepo;
	@Mock
	private RoleRepo mockRoleRepo;
	@Mock
	private BCryptPasswordEncoder mockBCyptPwdEncoder;
	
	private UserService userServiceTesting;
	private User user;
	
	@Before
	public void setUp() {
		initMocks(this);
		
		userServiceTesting = new UserService(mockUserRepo,mockRoleRepo,mockBCyptPwdEncoder);
		user = User.builder()
				.id(1)
				.name("Daniel")
				.lastName("Chang'masa")
				.email("danchangmasa@gmail.com")
				.build();
		Mockito.when(mockUserRepo.save(any()))
			.thenReturn(user);
		Mockito.when(mockUserRepo.findByEmail(anyString()))
			.thenReturn(user);
	}
	
	@Test
	public void testUserByEmail() {
		
		final String email = "danchangmasa@gmail.com";
		final User result = userServiceTesting.findUserByEmail(email);
		assertEquals(email,result.getEmail());
	}
	
	@Test
    public void testSaveUser() throws Exception {
        final String email = "danchangmasa@gmail.com";
        userServiceTesting.saveUser(User.builder().build());
        User result = userServiceTesting.findUserByEmail(email);
        assertEquals(email, result.getEmail());
    }
	
}

