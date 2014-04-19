<?php
/**
 * Created by PhpStorm.
 * User: matthewclamp
 * Date: 1/27/14
 * Time: 11:02 PM
 */

$uid = $_GET['uid'];

$mysqli = new mysqli("localhost", "mclamp_ha", "huskies2014", "mclamp_spring2014");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

$res = $mysqli->query("INSERT INTO `Evaluations`(`Date`, `UID`, `Year`, `TourSize`, `PromptArrival`, `ProperIntroduction`, `SafetyInCrosswalk`, `WalkBackwards`, `AccurateFacts`, `SevenColleges`, `TourLength`, `Circumstances`, `GeneralFeedback`, `Stories`, `StoriesComments`, `Academics`, `AcademicsComments`, `Research`, `ResearchComments`, `ServiceLearning`, `ServiceLearningComments`, `StudyAbroad`, `StudyAbroadComments`, `Coop`, `CoopComments`, `StudentLife`, `StudentLifeComments`, `Presentation`, `PresentationComments`, `Questions`, `QuestionsComments`, `PresentationBlurb`, `TourStrengths`, `Improving`, `Color`, `FlaggedHuh`, `AdditionalComments`, `BringUp`)
VALUES (NOW(), $_GET[uid], '$_POST[year]','$_POST[estimate]','$_POST[arrival]','$_POST[introduction]','$_POST[safety]','$_POST[backwards]','$_POST[facts]','$_POST[sevencolleges]','$_POST[time]','$_POST[circumstances]','$_POST[generalfeedback]','$_POST[stories]','$_POST[storiescomments]','$_POST[academics]','$_POST[academicscomments]','$_POST[research]','$_POST[researchcomments]','$_POST[servicelearning]','$_POST[servicelearningcomments]','$_POST[studyabroad]','$_POST[studyabroadcomments]','$_POST[coop]','$_POST[coopcomments]','$_POST[studentlife]','$_POST[studentlifecomments]','$_POST[presentation]','$_POST[presentationcomments]','$_POST[questions]','$_POST[questionscomments]','$_POST[presentationskills]', '$_POST[strengths]','$_POST[improve]','$_POST[color]','$_POST[colorcomments]','$_POST[additional]', '$_POST[addressed]')");

echo "Thanks for submitting an evaluation!";

?>