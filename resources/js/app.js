import './bootstrap';
import { getData, validateUserInformation, submitFeedback, submitDocument, getFormationList, appendFormation } from './function';
(async function () {
    await getFormationList().then(response => appendFormation(response)).catch(error => console.error(error));
})();
/*
getData();
validateUserInformation();
submitFeedback();
submitDocument(); */
