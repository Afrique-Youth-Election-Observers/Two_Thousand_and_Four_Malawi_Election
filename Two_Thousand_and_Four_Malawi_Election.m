% Program to determine the majority winner of an election.
% This software prompts the user to enter the total valid votes for each candidate.
% It calculates and compares the votes to determine the candidate with the highest vote count.
% The program is designed to handle multiple candidates and identifies the winner of the election.
%
% Developed by: Ian Carter Kulani
% Purpose: To calculate and display the winner of an election based on vote counts.
% Contact: iancarterkulani@gmail.com | Phone: +265988061969



% Input the total registered voters, total votes, and total valid votes
Total_Registered_Voters = input('Enter Total Number of Registered Voters:');
Total_Votes = input('Enter Total Number of Votes:');
Total_Valid_Votes = input('Enter Total Number of Valid Votes:');
Total_Null_and_Void_Votes = input('Enter Total Number of Invalid Votes/Blank Votes:');

% Input the total valid votes for each political party
Total_Valid_Votes_For_United_Democratic_Front = input('Enter Total Valid Votes For United Democratic Front (UDF):');
Total_Valid_Votes_For_Malawi_Congress_Party = input('Enter Total Valid Votes For Malawi Congress Party (MCP):');
Total_Valid_Votes_For_Mgwrizano_Coalition = input('Enter Total Valid Votes For Mgwirizano Coalition:');
Total_Valid_Votes_For_National_Democratic_Alliance = input('Enter Total Valid Votes For National Democratic Alliance (NDA):');
Total_Valid_Votes_For_Peoples_Progressive_Movement = input('Enter Total Valid Votes For Peoples Progressive Movement (PPM):');

% Calculate majority (more than half of total valid votes)
Majority = Total_Valid_Votes / 2 + 1;

% Calculate the percentages for each party
Percentage_UDF = (Total_Valid_Votes_For_United_Democratic_Front / Total_Valid_Votes) * 100;
Percentage_MCP = (Total_Valid_Votes_For_Malawi_Congress_Party / Total_Valid_Votes) * 100;
Percentage_Mgwrizano = (Total_Valid_Votes_For_Mgwrizano_Coalition / Total_Valid_Votes) * 100;
Percentage_NDA = (Total_Valid_Votes_For_National_Democratic_Alliance / Total_Valid_Votes) * 100;
Percentage_PPM = (Total_Valid_Votes_For_Peoples_Progressive_Movement / Total_Valid_Votes) * 100;

% Display the percentages for each party
fprintf('\nPercentage of Votes for Each Party:\n');
fprintf('United Democratic Front (UDF): %.2f%%\n', Percentage_UDF);
fprintf('Malawi Congress Party (MCP): %.2f%%\n', Percentage_MCP);
fprintf('Mgwirizano Coalition: %.2f%%\n', Percentage_Mgwrizano);
fprintf('National Democratic Alliance (NDA): %.2f%%\n', Percentage_NDA);
fprintf('Peoples Progressive Movement (PPM): %.2f%%\n', Percentage_PPM);

% Determine the winner based on majority
if Total_Valid_Votes_For_United_Democratic_Front >= Majority
    disp('United Democratic Front (UDF) is the Winner of the Election');
elseif Total_Valid_Votes_For_Malawi_Congress_Party >= Majority
    disp('Malawi Congress Party (MCP) is the Winner of the Election');
elseif Total_Valid_Votes_For_Mgwrizano_Coalition >= Majority
    disp('Mgwirizano Coalition is the Winner of the Election');
elseif Total_Valid_Votes_For_National_Democratic_Alliance >= Majority
    disp('National Democratic Alliance (NDA) is the Winner of the Election');
elseif Total_Valid_Votes_For_Peoples_Progressive_Movement >= Majority
    disp('Peoples Progressive Movement (PPM) is the Winner of the Election');
else
    disp('No Political Party has a Majority Winner in the Election');
end

% --- Pie Chart Visualization ---
% Data for Pie chart
party_names = {'UDF', 'MCP', 'Mgwirizano Coalition', 'NDA', 'PPM'};
vote_percentages = [Percentage_UDF, Percentage_MCP, Percentage_Mgwrizano, Percentage_NDA, Percentage_PPM];
colors = [1, 1, 0; % Yellow for UDF
          1, 0, 0; % Red for MCP
          0.5, 1, 0.5; % Fade green for Mgwirizano
          0.5, 0, 0.5; % Purple for NDA
          0.5, 0.5, 0.5]; % Grey for PPM

% Create Pie Chart
figure;
pie(vote_percentages);
colormap(colors); % Set the color of the pie chart sections
legend(party_names, 'Location', 'bestoutside');
title('Election Results - Party Vote Percentages');

% --- Bar Chart Visualization ---
% Data for Bar chart
figure;
bar(vote_percentages);
set(gca, 'XTickLabel', party_names); % Set party names as x-axis labels
ylabel('Percentage of Votes (%)');
title('Election Results - Party Vote Percentages');
ylim([0 100]); % Set y-axis limit to 100% for clarity

% Optionally, if you want to modify the bar colors to match the pie chart:
% Assign the same colors for the bars
bars = bar(vote_percentages);
bars.FaceColor = 'flat';
bars.CData = colors; % Apply the colors
