package com.becomejavasenior.service;

import com.becomejavasenior.entity.*;
import com.becomejavasenior.jdbc.entity.*;
import com.becomejavasenior.service.impl.DealServiceImpl;
import com.becomejavasenior.template.CompanyDAO;
import com.becomejavasenior.template.DealDAO;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static junit.framework.TestCase.assertNotNull;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyInt;
import static org.mockito.Matchers.anyString;
import static org.mockito.Mockito.*;

public class DealServiceTest {

    private static final int INT_1 = 1;
    private static final String DEF_NAME = "Default Name";

    private static final String VAL_EMPTY = "";
    private static final String VAL_STR_0 = "0";
    private static final String VAL_STR_1 = "1";
    private static final String VAL_PHONE = "phone number 1";
    private static final String VAL_EMAIL = "default@email";
    private static final String VAL_TASK_DATE = "2020-10-15";
    private static final String VAL_TASK_TIME = "22";
    private static final String VAL_TAGS = "#22 #tag #tag name 13 ";

    //parameter fields
    private static final String DEAL_NAME = "dealName";
    private static final String DEAL_USER_ID = "dealUserId";
    private static final String DEAL_STAGE = "dealStage";
    private static final String DEAL_BUDGET = "dealBudget";
    private static final String DEAL_TAGS = "dealTags";

    private static final String COMPANY_NEW = "companyNew";
    private static final String COMPANY_NAME = "companyName";
    private static final String COMPANY_PHONE = "companyPhone";
    private static final String COMPANY_EMAIL = "companyEmail";
    private static final String COMPANY_ADDRESS = "companyAddress";
    private static final String COMPANY_ID = "companyId";

    private static final String CONTACT_NEW = "contactNew";
    private static final String CONTACT_NAME = "contactName";
    private static final String CONTACT_COMPANY_ID = "contactCompanyId";
    private static final String CONTACT_TYPE_PHONE = "contactTypePhone";
    private static final String CONTACT_PHONE = "contactPhone";
    private static final String CONTACT_POSITION = "contactPosition";
    private static final String CONTACT_EMAIL = "contactEmail";
    private static final String CONTACT_SKYPE = "contactSkype";
    private static final String CONTACT_ID = "contactId";

    private static final String TASK_DATE = "taskDate";
    private static final String TASK_TIME = "taskTime";
    private static final String TASK_RESPONSIBLE_USER = "taskUserId";
    private static final String TASK_TYPE = "taskType";
    private static final String TASK_TEXT = "taskText";
    private static final String TASK_STATUS_NEW = "task.status.in_progress";
    private static final String TASK_TIME_ALL_DAY = "task.time.ALL_DAY";

    private static final String NOTE_TEXT = "noteText";

    @Mock
    private DealDAO dealDAO;
    @Mock
    private ContactDAO contactDAO;
    @Mock
    private CompanyDAO companyDAO;
    @Mock
    private TaskDAO taskDAO;
    @Mock
    private NoteDAO noteDAO;
    @Mock
    private StageDAO stageDAO;
    @Mock
    private FileDAO fileDAO;
    @Mock
    private UserDAO userDAO;
    @Mock
    private TagDAO tagDAO;

    @InjectMocks
    private DealService dealService = new DealServiceImpl();

    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        User currentUser = new User();
        currentUser.setId(INT_1);
        dealService.setCurrentUser(currentUser);
    }

    @Test
    public void testInsert() {
        dealService.insert(any(Deal.class));
        verify(dealDAO).insert(any(Deal.class));
    }

    @Test
    public void testGetAllDealsByStage() {
        List<Deal> dealList = new ArrayList<>();
        Deal testDeal = new Deal();
        testDeal.setId(INT_1);
        testDeal.setName(DEF_NAME);
        dealList.add(testDeal);
        when(dealDAO.getDealsByStage(DEF_NAME)).thenReturn(dealList);

        assertNotNull(dealService.getAllDealsByStage(DEF_NAME));
        assertEquals(INT_1, dealService.getAllDealsByStage(DEF_NAME).size());
        verify(dealDAO, times(2)).getDealsByStage(anyString());
    }

    @Test
    public void testGetContactsByDealId() {
        List<Contact> contactList = new ArrayList<>();
        Contact testContact = new Contact();
        testContact.setId(INT_1);
        testContact.setName(DEF_NAME);
        contactList.add(testContact);
        when(dealDAO.getContactsByDealId(INT_1)).thenReturn(contactList);

        assertNotNull(dealService.getContactsByDealId(INT_1));
        assertEquals(INT_1, dealService.getContactsByDealId(INT_1).size());
        verify(dealDAO, times(2)).getContactsByDealId(anyInt());
    }

    @Test
    public void testGetAllStage() {
        List<Stage> stageList = new ArrayList<>();
        Stage testStage = new Stage();
        testStage.setId(INT_1);
        testStage.setName(DEF_NAME);
        stageList.add(testStage);
        when(dealDAO.getAllStage()).thenReturn(stageList);

        assertNotNull(dealService.getAllStage());
        assertEquals(INT_1, dealService.getAllStage().size());
        verify(dealDAO, times(2)).getAllStage();
    }

    @Test
    public void testGetDealsForList() {
        List<Deal> dealList = new ArrayList<>();
        Deal testDeal = new Deal();
        testDeal.setId(INT_1);
        testDeal.setName(DEF_NAME);
        dealList.add(testDeal);
        when(dealDAO.getDealsForList()).thenReturn(dealList);

        assertNotNull(dealService.getDealsForList());
        assertEquals(INT_1, dealService.getDealsForList().size());
        verify(dealDAO, times(2)).getDealsForList();
    }

    @Test
    public void testUpdate() {
        dealService.update(any(Deal.class));
        verify(dealDAO).update(any(Deal.class));
    }

    @Test
    public void testGetAll() {
        dealService.getAll();
        verify(dealDAO).getAll();
    }

    @Test
    public void testById() {
        dealService.getById(INT_1);
        verify(dealDAO).getById(INT_1);
    }

    @Test
    public void testDelete() {
        dealService.delete(INT_1);
        verify(dealDAO).delete(INT_1);
    }

    //create
    @Test
    public void testGetUserList() {
        List<User> userList = new ArrayList<>();
        User testUser = new User();
        testUser.setId(INT_1);
        testUser.setName(DEF_NAME);
        userList.add(testUser);
        when(userDAO.getAll()).thenReturn(userList);

        assertNotNull(dealService.getUserList());
        assertEquals(INT_1, dealService.getUserList().size());
        verify(userDAO, times(2)).getAll();
    }

    @Test
    public void testGetContactList() {
        List<Contact> contactList = new ArrayList<>();
        Contact testContact = new Contact();
        testContact.setId(INT_1);
        testContact.setName(DEF_NAME);
        contactList.add(testContact);
        when(contactDAO.getAll()).thenReturn(contactList);

        assertNotNull(dealService.getContactList());
        assertEquals(INT_1, dealService.getContactList().size());
        verify(contactDAO, times(2)).getAll();
    }

    @Test
    public void testGetCompanyList() {
        List<Company> companyList = new ArrayList<>();
        Company testCompany = new Company();
        testCompany.setId(INT_1);
        testCompany.setName(DEF_NAME);
        companyList.add(testCompany);
        when(companyDAO.getAll()).thenReturn(companyList);

        assertNotNull(dealService.getCompanyList());
        assertEquals(INT_1, dealService.getCompanyList().size());
        verify(companyDAO, times(2)).getAll();
    }

    @Test
    public void testGetStageList() {
        List<Stage> stageList = new ArrayList<>();
        Stage testStage = new Stage();
        testStage.setId(INT_1);
        testStage.setName(DEF_NAME);
        stageList.add(testStage);
        when(stageDAO.getAll()).thenReturn(stageList);

        assertNotNull(dealService.getStageList());
        assertEquals(INT_1, dealService.getStageList().size());
        verify(stageDAO, times(2)).getAll();
    }

    @Test
    public void testGetPhoneTypes() {
        assertArrayEquals(TypeOfPhone.values(), dealService.getPhoneTypes());
    }

    @Test
    public void testGetPeriodTypes() {
        assertArrayEquals(TypeOfPeriod.values(), dealService.getPeriodTypes());
    }

    @Test
    public void testGetTaskTypesList() {
        List<String> taskTypeList = new ArrayList<>();
        taskTypeList.add(DEF_NAME);
        when(taskDAO.getAllTaskType()).thenReturn(taskTypeList);

        Assert.assertNotNull(dealService.getTaskTypesList());
        assertEquals(INT_1, dealService.getTaskTypesList().size());
        assertEquals(DEF_NAME, dealService.getTaskTypesList().get(0));
        verify(taskDAO, times(3)).getAllTaskType();
    }

    @Test
    public void testGetTaskTimeList() {
        Assert.assertNotNull(dealService.getTaskTimeList());
        assertEquals(49, dealService.getTaskTimeList().size());
        assertEquals(TASK_TIME_ALL_DAY, dealService.getTaskTimeList().get(0));
    }

    @Test
    public void testCreateByParameters() {
        Map<String, String> parameters = new HashMap<>();

        // no primary values
        parameters.put(COMPANY_NEW, VAL_STR_0);
        parameters.put(COMPANY_ID, VAL_EMPTY);
        dealService.createByParameters(parameters, null);

        // no secondary values
        parameters.put(DEAL_NAME, VAL_EMPTY);
        parameters.put(DEAL_USER_ID, VAL_EMPTY);
        parameters.put(DEAL_STAGE, VAL_EMPTY);
        dealService.createByParameters(parameters, null);

        // check get exist company
        parameters.put(DEAL_NAME, DEF_NAME);
        parameters.put(DEAL_STAGE, DEF_NAME);
        parameters.put(DEAL_USER_ID, VAL_STR_1);
        parameters.put(DEAL_BUDGET, VAL_STR_1);
        parameters.put(COMPANY_NEW, VAL_STR_0);
        parameters.put(COMPANY_ID, VAL_STR_1);
        dealService.createByParameters(parameters, null);
        verify(companyDAO).getById(INT_1);
        verify(stageDAO).insert(any(Stage.class));

        // check insert new company
        parameters.put(COMPANY_NEW, VAL_STR_1);
        parameters.put(COMPANY_NAME, DEF_NAME);
        parameters.put(COMPANY_PHONE, VAL_PHONE);
        parameters.put(COMPANY_EMAIL, VAL_EMAIL);
        parameters.put(COMPANY_ADDRESS, VAL_EMAIL);
        dealService.createByParameters(parameters, null);
        verify(companyDAO).insert(any(Company.class));

        // "real" deal create
        when(dealDAO.insert(any(Deal.class))).thenReturn(INT_1);

        // required parameters with no values
        parameters.put(TASK_DATE, VAL_TASK_DATE);
        parameters.put(TASK_TIME, VAL_TASK_TIME);
        parameters.put(TASK_RESPONSIBLE_USER, VAL_STR_1);
        parameters.put(TASK_TYPE, VAL_EMPTY);
        parameters.put(NOTE_TEXT, VAL_EMPTY);
        parameters.put(DEAL_TAGS, VAL_EMPTY);
        List<File> testFileList = new ArrayList<>();

        // check get exist contact
        parameters.put(CONTACT_NEW, VAL_STR_0);
        parameters.put(CONTACT_ID, VAL_STR_1);
        dealService.createByParameters(parameters, testFileList);
        verify(contactDAO).getById(INT_1);

        // check create new contact
        parameters.put(CONTACT_NEW, VAL_STR_1);
        parameters.put(CONTACT_NAME, DEF_NAME);
        parameters.put(CONTACT_COMPANY_ID, VAL_STR_1);
        parameters.put(CONTACT_TYPE_PHONE, VAL_STR_1);
        parameters.put(CONTACT_PHONE, VAL_PHONE);
        parameters.put(CONTACT_POSITION, DEF_NAME);
        parameters.put(CONTACT_EMAIL, VAL_EMAIL);
        parameters.put(CONTACT_SKYPE, DEF_NAME);
        dealService.createByParameters(parameters, testFileList);
        verify(dealDAO, times(4)).insert(any(Deal.class));
        verify(companyDAO, times(2)).getById(INT_1);
        verify(contactDAO).insert(any(Contact.class));

        // create task
        parameters.put(TASK_TEXT, DEF_NAME);
        parameters.put(TASK_STATUS_NEW, DEF_NAME);
        parameters.put(TASK_TYPE, DEF_NAME);
        dealService.createByParameters(parameters, testFileList);
        verify(taskDAO).insert(any(Task.class));

        // create note
        parameters.put(NOTE_TEXT, DEF_NAME);
        dealService.createByParameters(parameters, testFileList);
        verify(noteDAO).insert(any(Note.class));

        // create file
        File file = new File();
        file.setFile(DEF_NAME.getBytes());
        file.setFileSize(DEF_NAME.length());
        file.setFileName(DEF_NAME);
        testFileList.add(file);
        dealService.createByParameters(parameters, testFileList);
        verify(fileDAO).insert(any(File.class));

        // create tags
        parameters.put(DEAL_TAGS, VAL_TAGS);
        dealService.createByParameters(parameters, testFileList);

        verify(dealDAO, times(8)).insert(any(Deal.class));
        verify(stageDAO, times(8)).insert(any(Stage.class));
        verify(companyDAO, times(6)).getById(INT_1);
        verify(contactDAO, times(5)).insert(any(Contact.class));
        verify(taskDAO, times(4)).insert(any(Task.class));
        verify(noteDAO, times(3)).insert(any(Note.class));
        verify(fileDAO, times(2)).insert(any(File.class));
        verify(tagDAO, times(3)).insertForDeal(anyInt(), any(Tag.class));
        // create deal: 8  create task: 4
        verify(userDAO, times(12)).getById(anyInt());
    }

    @After
    public void tearDown() {
        dealDAO = null;
        contactDAO = null;
        companyDAO = null;
        taskDAO = null;
        stageDAO = null;
        noteDAO = null;
        fileDAO = null;
        tagDAO = null;
        userDAO = null;
        dealService = null;
    }
}
