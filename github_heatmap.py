import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_excel('GitHub_commits.xlsx')

df['DateTime'] = pd.to_datetime(df['DateTime'])
df['Date'] = df['DateTime'].dt.date
df['Time'] = df['DateTime'].dt.time



fig = plt.figure()
ax = fig.add_subplot(111)
ax.grid()
plt.style.use('seaborn')

plt.plot(df['Date'],df['Time'],'bo', alpha=.5)
plt.title('GitHub Commits')

# format x-axis ticks as dates
import matplotlib.dates as mdates
years = mdates.YearLocator()   # every year
months = mdates.MonthLocator()  # every month
yearsFmt = mdates.DateFormatter('\n%Y')
moFmt = mdates.DateFormatter('%m') # (%b for Jan, Feb Mar; %m for 01 02 03)
ax.xaxis.set_major_locator(years)
ax.xaxis.set_minor_locator(months)
ax.xaxis.set_major_formatter(yearsFmt)
ax.xaxis.set_minor_formatter(moFmt)


plt.savefig('commit_history.png')
