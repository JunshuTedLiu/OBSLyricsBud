# OBSLyricsBud
OBSLyricsBud is a plugin for Open Broadcaster Software (OBS) that can help you display song lyrics or captions in your live stream. You can control the lyrics/subtitles by simply pressing buttons for the next/previous sentence.<br>
Video demonstration available soon.

<h2>Who Needs OBSLyricsBud?</h2>
Live stream broadcasters, especially music lovers/singers. You need this if
<ul>
  <li>you have music playing in your live stream and would like to show the lyrics;</li>
  <li>you are a singer and you would like to make a live karaoke with lyrics displaying on the screen.</li>
</ul>

<h2>How to Use it?</h2>
Step 1. Find the song lyrics you would like to use.
Step 2. Copy these lyrics text and paste it into the text field here.
Step 3. Apply these lyrics by pressing "apply". You will see the "Current Sentence" and "Next Sentence" session is updated.
Step 4. In OBS, create a new source "Text (FreeType 2)" for your Current Sentence.
Step 5. Select "Read from file".
Step 6. Click "Browse". Go to your home directory (you can do that by click on your username in the sidebar). 
Step 7. Search for "current.txt". Select this file.
Step 8. Congratulations, you have a text source for displaying the current sentence. Select "OK" to close the window.
Step 4 1/2 (Optional). You can do the same thing for the Next Sentence. The procedure is the same from Step 4. The file name you need to search is called "next.txt".
Step 9. Now, you can control the lyrics in the app.
- "restart": Restart the lyrics from the beginning.
- "< previous": jump to the previous sentence.
- "> next": jump to the next sentence.

<h2>How this Works</h2>
OBS for mac has a test source called "Text (FreeType 2)" that allows you to show the text content read from a text file (txt). This plugin creates two text files, "current.txt" and "next.txt", in the document directory of this app, which is inside your home folder. What we are doing is linking these files into your OBS text sources.

<h2>Problems</h2>
In the current version, there is a significant lag on my MacBook Pro. According to my test, the text file updates almost instantly, but the text source in OBS reading the text file responses a bit slow. When you are controlling the lyrics, I suggest you press the "< previous" and "> next" button 1~2 seconds earlier.

<h2>Future Thoughts</h2>
<p>In this version, you can import and control the lyrics line by line manually.</p>
<p>It would be cooler if I can use some lyrics database and API to make it more convenient to use.
<p>First, importing the lyrics. Using an online database for song lyrics, maybe I can implement a lyrics search functionality in this app, and the user can get the lyrics by just searching by song names.</p>
<p>Second, real-time lyrics updating. This might be difficult, but I think it is doable. The Musixmatch API could probably make me do that.</p>
<p>But first, you will see some UI updates in the future version.</p>

<h2>Similar Plugins</h2>
I also made a plugin for OBS, OBSTimeBud, that can display the current time in the live stream.

<h2>Current Version</h2>
1.0 Beta1

<h2>Feedback</h2>
If you have any question or advice, please email me by junshutedliu@gmail.com.
