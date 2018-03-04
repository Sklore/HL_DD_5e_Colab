<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="xml" version="1.0" encoding="iso-8859-1" indent="yes" omit-xml-declaration="no"/>
      <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&#13;</xsl:text>
    <root version='3.3' release='8|CoreRPG:3'>
      <xsl:text disable-output-escaping="yes">&#13;</xsl:text>
       <character><xsl:text disable-output-escaping="yes">&#13;</xsl:text>
          
          <!-- Start ABILITIES -->
          <abilities>
           <xsl:for-each select="document/public/character/abilityscores/abilityscore">
               <xsl:text disable-output-escaping="yes">&#13;&lt;</xsl:text><xsl:value-of select='translate(@name, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz")' /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               <xsl:text disable-output-escaping="yes">&lt;score type='number'></xsl:text>
                  <xsl:value-of select="abilvalue/@text" />
               <xsl:text disable-output-escaping="yes">&lt;/score>&#13;</xsl:text>
               <xsl:text disable-output-escaping="yes">&lt;save type='number'></xsl:text>
                  <xsl:value-of select="savingthrow/@text" />
               <xsl:text disable-output-escaping="yes">&lt;/save>&#13;</xsl:text>
               <xsl:text disable-output-escaping="yes">&lt;bonus type='number'></xsl:text>
                  <xsl:value-of select="abilbonus/@text" />
               <xsl:text disable-output-escaping="yes">&lt;/bonus>&#13;</xsl:text>
               <xsl:text disable-output-escaping="yes">&lt;saveprof type='number'></xsl:text>
                  <xsl:choose>
                     <xsl:when test="savingthrow/@isproficient='yes'">
                        <xsl:text>1</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text>0</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
               <xsl:text disable-output-escaping="yes">&lt;/saveprof>&#13;</xsl:text>
               <xsl:text disable-output-escaping="yes">&lt;/</xsl:text><xsl:value-of select='translate(@name, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz")' /><xsl:text disable-output-escaping="yes">></xsl:text>
           </xsl:for-each>
         </abilities><xsl:text>&#13;</xsl:text>
         <!-- End ABILITIES -->
         
         <!-- Start BACKGROUNDS -->
         <background type='string'>
               <xsl:value-of select="document/public/character/background/@name" />
         </background><xsl:text>&#13;</xsl:text>
         <backgroundlink type="windowreference"><xsl:text>&#13;</xsl:text>
            <class>reference_background</class><xsl:text>&#13;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;recordname&gt;reference.backgrounddata.</xsl:text><xsl:value-of select='translate(document/public/character/background/@name,"ABCDEFGHIJKLMNOPQRSTUVWXYZ ", "abcdefghijklmnopqrstuvwxyz")' /><xsl:text disable-output-escaping="yes">@*&lt;/recordname&gt;&#13;</xsl:text>
         </backgroundlink><xsl:text>&#13;</xsl:text>
         <bonds type="string">
                <xsl:value-of select='translate(document/public/character/background/backgroundtrait[@type="bond"], "&#8217;", "&#39;")' />
         </bonds><xsl:text>&#13;</xsl:text>
         <flaws type="string">
                <xsl:value-of select='translate(document/public/character/background/backgroundtrait[@type="flaw"], "&#8217;", "&#39;")' />
         </flaws><xsl:text>&#13;</xsl:text>
         <ideals type="string">
                <xsl:value-of select='translate(document/public/character/background/backgroundtrait[@type="ideal"], "&#8217;", "&#39;")' />
         </ideals><xsl:text>&#13;</xsl:text>
         <personalitytraits type="string">
         <xsl:for-each select='document/public/character/background/backgroundtrait[@type="personalitytrait"]'>
            <xsl:value-of select='translate(., "&#8217;", "&#39;")' /><xsl:text>\n</xsl:text>
         </xsl:for-each>
         </personalitytraits><xsl:text>&#13;</xsl:text>
         <!-- End BACKGROUNDS -->
         
         <!-- Start CLASSES -->
         <classes><xsl:text>&#13;</xsl:text>
         <xsl:for-each select="document/public/character/classes/class">
            <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
            <level type='number'><xsl:value-of select="@level" /></level><xsl:text>&#13;</xsl:text>
            <name type='string'><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
            <hddie type='dice'>d<xsl:value-of select="classhitdice/@sides" /></hddie><xsl:text>&#13;</xsl:text>
            <shortcut type="windowreference"><xsl:text>&#13;</xsl:text>
					<class>reference_class</class><xsl:text>&#13;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;recordname&gt;reference.classdata.</xsl:text><xsl:value-of select='translate(@name,"ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz")' /><xsl:text disable-output-escaping="yes">@*&lt;/recordname&gt;&#13;</xsl:text>
				</shortcut><xsl:text>&#13;</xsl:text>
            <xsl:choose>
               <xsl:when test="@casterlevelprogression='third'">
                  <casterlevelinvmult type="number">3</casterlevelinvmult><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@casterlevelprogression='half'">
                  <casterlevelinvmult type="number">2</casterlevelinvmult><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@casterlevelprogression='normal'">
                  <casterlevelinvmult type="number">1</casterlevelinvmult><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <casterlevelinvmult type="number">0</casterlevelinvmult><xsl:text>&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
               <xsl:when test="@name='Warlock'">
                  <casterpactmagic type="number">1</casterpactmagic><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <casterpactmagic type="number">0</casterpactmagic><xsl:text>&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
         </xsl:for-each>
         </classes><xsl:text>&#13;</xsl:text>
         <!-- End CLASSES -->
         
         <!-- Start LANGUAGES -->
         <languagelist><xsl:text>&#13;</xsl:text>
         <xsl:for-each select="document/public/character/languages/language">
            <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               <name type="string"><xsl:value-of select="@name" /></name>
            <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
         </xsl:for-each>
         </languagelist><xsl:text>&#13;</xsl:text>
         <!-- End LANGUAGES -->
         
         <!-- Start SKILLS -->
         <skilllist><xsl:text>&#13;</xsl:text>
         <xsl:for-each select="document/public/character/skills/skill">
            <xsl:choose>
               <xsl:when test="number(position()) &lt; 10">
                  <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <name type="string"><xsl:value-of select="@name" /></name>
            <xsl:choose>
               <xsl:when test="@isproficient='yes'">
                  <prof type="number">1</prof><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <prof type="number">0</prof><xsl:text>&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
               <xsl:when test="@abilabbreviation='STR'">
                  <stat type="string">strength</stat><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@abilabbreviation='DEX'">
                  <stat type="string">dexterity</stat><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@abilabbreviation='CON'">
                  <stat type="string">constitution</stat><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@abilabbreviation='INT'">
                  <stat type="string">intelligence</stat><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@abilabbreviation='WIS'">
                  <stat type="string">wisdom</stat><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@abilabbreviation='CHA'">
                  <stat type="string">charisma</stat><xsl:text>&#13;</xsl:text>
               </xsl:when>
            </xsl:choose>
           <total type="number"><xsl:value-of select="@value" /></total><xsl:text>&#13;</xsl:text>
            <xsl:choose>
            <xsl:when test="number(position()) &lt; 10">
               <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
               <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
            </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
         </skilllist><xsl:text>&#13;</xsl:text>
         <!-- End SKILLS -->
         
         <!-- Start RACE -->
         <race type="string"><xsl:value-of select="document/public/character/race/@displayname" /></race><xsl:text>&#13;</xsl:text>
		   <racelink type="windowreference"><xsl:text>&#13;</xsl:text>
			<class>reference_race</class><xsl:text>&#13;</xsl:text>
			<xsl:text disable-output-escaping="yes">&lt;recordname&gt;reference.racedata.</xsl:text><xsl:value-of select='translate(document/public/character/race/@name,"ABCDEFGHIJKLMNOPQRSTUVWXYZ-", "abcdefghijklmnopqrstuvwxyz_")' /><xsl:text disable-output-escaping="yes">@*&lt;/recordname&gt;&#13;</xsl:text>
		   </racelink><xsl:text>&#13;</xsl:text>
         <!-- End RACE -->
         
         <!-- CHARACTER NAME -->
         <name type="string"><xsl:value-of select="document/public/character/@name" /></name><xsl:text>&#13;</xsl:text>
         
         <!-- HEALTH -->
         <hp><xsl:text>&#13;</xsl:text>
			<temporary type="number">0</temporary><xsl:text>&#13;</xsl:text>
			<total type="number"><xsl:value-of select="document/public/character/health/@hitpoints" /></total><xsl:text>&#13;</xsl:text>
			<wounds type="number"><xsl:value-of select="document/public/character/health/@damage" /></wounds><xsl:text>&#13;</xsl:text>
		   </hp><xsl:text>&#13;</xsl:text>
         
         <!-- PERSONAL -->
         <gender type="string"><xsl:value-of select="document/public/character/personal/@gender" /></gender><xsl:text>&#13;</xsl:text>
         <height type="string"><xsl:value-of select="document/public/character/personal/charheight/@text" /></height>
         <age type="string"><xsl:value-of select="document/public/character/personal/@age" /></age><xsl:text>&#13;</xsl:text>
         <weight type="string"><xsl:value-of select="document/public/character/personal/charweight/@text" /></weight><xsl:text>&#13;</xsl:text>
         <size type="string"><xsl:value-of select="document/public/character/size/@name" /></size><xsl:text>&#13;</xsl:text>
         <deity type="string"><xsl:value-of select="document/public/character/deity/@name" /></deity><xsl:text>&#13;</xsl:text>
         <alignment type="string"><xsl:value-of select="document/public/character/alignment/@name" /></alignment><xsl:text>&#13;</xsl:text>
         
         <!-- Start SPELL SLOTS -->
         <powermeta>
         <xsl:for-each select="document/public/character/spellslots/spellslot">
            <xsl:choose>
               <xsl:when test="@name='1st'">
                  <spellslots1>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </spellslots1><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='2nd'">
                  <spellslots2>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </spellslots2><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='3rd'">
                  <spellslots3>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </spellslots3><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='4th'">
                  <spellslots4>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </spellslots4><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='5th'">
                  <spellslots5>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </spellslots5><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='6th'">
                  <spellslots6>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </spellslots6><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='7th'">
                  <spellslots7>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </spellslots7><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='8th'">
                  <spellslots8>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </spellslots8><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='9th'">
                  <spellslots9>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </spellslots9><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='Warlock (1st)'">
                  <pactmagicslots1>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </pactmagicslots1><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='Warlock (2nd)'">
                  <pactmagicslots2>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </pactmagicslots2><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='Warlock (3rd)'">
                  <pactmagicslots3>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </pactmagicslots3><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='Warlock (4th)'">
                  <pactmagicslots4>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </pactmagicslots4><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@name='Warlock (5th)'">
                  <pactmagicslots5>
				         <max type="number"><xsl:value-of select="@count" /></max><xsl:text>&#13;</xsl:text>
			         </pactmagicslots5><xsl:text>&#13;</xsl:text>
               </xsl:when>
            </xsl:choose>
         </xsl:for-each>
         </powermeta><xsl:text>&#13;</xsl:text>
         <!-- End SPELL SLOTS -->
         
         <!-- Start SPELLS -->
         <powers>
         <xsl:for-each select="document/public/character/cantrips/spell | document/public/character/spellsknown/spell | document/public/character/spellsmemorized/spell | document/public/character/racespells/spellability">
            <xsl:choose>
               <xsl:when test="number(position()) &lt; 10">
                  <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
               <xsl:when test="@level='0th'">
                  <level type="number">0</level><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@level='1st'">
                  <level type="number">1</level><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@level='2nd'">
                  <level type="number">2</level><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@level='3rd'">
                  <level type="number">3</level><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@level='4th'">
                  <level type="number">4</level><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@level='5th'">
                  <level type="number">5</level><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@level='6th'">
                  <level type="number">6</level><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@level='7th'">
                  <level type="number">7</level><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@level='8th'">
                  <level type="number">8</level><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:when test="@level='9th'">
                  <level type="number">9</level><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <level type="number">0</level><xsl:text>&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
				<locked type="number">1</locked><xsl:text>&#13;</xsl:text>
				<name type="string"><xsl:value-of select='translate(@name, "&#8217;", "&#39;")' /></name><xsl:text>&#13;</xsl:text>
            translate(., "&#8217;", "&#39;")
            <parse type="number">1</parse><xsl:text>&#13;</xsl:text>
            <description type="formattedtext"><xsl:text>&#13;</xsl:text>
				   <p><xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /></p><xsl:text>&#13;</xsl:text>
				</description><xsl:text>&#13;</xsl:text>
            <group type="string">Spells</group><xsl:text>&#13;</xsl:text>
            <school type="string"><xsl:value-of select="@schooltext" /></school><xsl:text>&#13;</xsl:text>
            <components type="string"><xsl:value-of select="@componenttext" /></components><xsl:text>&#13;</xsl:text>
            <range type="string"><xsl:value-of select="@range" /></range><xsl:text>&#13;</xsl:text>
            <castingtime type="string"><xsl:value-of select="@casttime" /></castingtime><xsl:text>&#13;</xsl:text>
            <duration type="string"><xsl:value-of select="@duration" /></duration><xsl:text>&#13;</xsl:text>
            <xsl:choose>
               <xsl:when test="number(position()) &lt; 10">
                  <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
         </powers><xsl:text>&#13;</xsl:text>
         <!-- End SPELLS -->
         
         <!-- Start INVENTORY LIST -->
         <inventorylist><xsl:text>&#13;</xsl:text>
         <xsl:for-each select="document/public/character/gear/item">
            <xsl:choose>
               <xsl:when test="number(position()) &lt; 10">
                  <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
            <xsl:if test='description != ""'>
            <description type="formattedtext">
					<p><xsl:value-of select='description' /></p>
				</description>
            </xsl:if>
            <xsl:variable name="thisitemname" select="@name" />
               <xsl:choose>
                  <xsl:when test='contains(@name, ")")' >
                     <name type="string"><xsl:value-of select='normalize-space(substring-before(@name, "("))' /></name><xsl:text>&#13;</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                     <name type="string"><xsl:value-of select='@name' /></name><xsl:text>&#13;</xsl:text>
                  </xsl:otherwise>
               </xsl:choose>
            <xsl:choose>
               <xsl:when test='heldin' >
                  <xsl:choose>
                     <xsl:when test='contains(heldin/@name, "Dropped to ground")'>
                        <carried type="number">0</carried><xsl:text>&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                     <location type="string"><xsl:value-of select='substring-before(heldin/@name, "(")' /></location>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>
            </xsl:choose>
            
            <xsl:choose>
               <!-- Let's do something if it's a weapon -->
               <xsl:when test='geartype/@text="Weapon"'>
                  <xsl:for-each select="//document/public/character/melee/weapon | //document/public/character/ranged/weapon">
                     <xsl:if test="@name=$thisitemname">
                        <damage type="string"><xsl:value-of select="@damage" /></damage>
                        <xsl:choose>
                           <xsl:when test='@equipped="mainhand"'>
                              <carried type="number">2</carried><xsl:text>&#13;</xsl:text>
                           </xsl:when>
                           <xsl:when test='@equipped="offhand"'>
                              <carried type="number">2</carried><xsl:text>&#13;</xsl:text>
                           </xsl:when>
                           <xsl:when test='@equipped="bothhands"'>
                              <carried type="number">2</carried><xsl:text>&#13;</xsl:text>
                           </xsl:when>
                           <xsl:otherwise>
                              <carried type="number">1</carried><xsl:text>&#13;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                        <properties type="string">
                           <xsl:for-each select="wepproperty" >
                           <xsl:if test="position() > 1 ">, </xsl:if>                       
                           <xsl:value-of select="."/>
                          </xsl:for-each>
                       </properties>
                       
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
               <!-- Let's do something if it's armor -->
               <xsl:when test='geartype/@text="Armor"'>
                  
                  <xsl:for-each select="//document/public/character/defenses/armor">
                     <xsl:if test="@name=$thisitemname">
                        <ac type="number"><xsl:value-of select="@ac" /></ac>
                        <stealth type="string"><xsl:value-of select="@stealth" /></stealth>
                        <dexbonus type="string"><xsl:value-of select="@maxdex" /></dexbonus>
                        <subtype type="string"><xsl:value-of select="armorcategory" /></subtype>
                        <xsl:choose>
                           <xsl:when test='@equipped="yes"'>
                              <carried type="number">2</carried><xsl:text>&#13;</xsl:text>
                           </xsl:when>
                           <xsl:otherwise>
                              <carried type="number">1</carried><xsl:text>&#13;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:when>
            </xsl:choose>
            <type type="string"><xsl:value-of select="geartype/@text" /></type><xsl:text>&#13;</xsl:text>
            <cost type="string"><xsl:value-of select="cost/@text" /></cost><xsl:text>&#13;</xsl:text>
            <count type="number"><xsl:value-of select="@quantity" /></count><xsl:text>&#13;</xsl:text>
            <weight type="number"><xsl:value-of select="weight/@value" /></weight><xsl:text>&#13;</xsl:text>
            <xsl:choose>
               <xsl:when test="number(position()) &lt; 10">
                  <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
         </inventorylist><xsl:text>&#13;</xsl:text>
         <!-- End INVENTORY LIST -->
         
         <!-- Start WEAPONS -->
         <weaponlist><xsl:text>&#13;</xsl:text>
         <xsl:for-each select="document/public/character/melee/weapon | document/public/character/ranged/weapon">
            <xsl:if test='not(@name="Unarmed strike")'>
            <xsl:choose>
               <xsl:when test="number(position()) &lt; 10">
                  <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
            <xsl:variable name="thiswepname" select="@name" />
            <xsl:choose>
               <xsl:when test="@isproficient='yes'">
                  <prof type="number">1</prof><xsl:text>&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <prof type="number">0</prof><xsl:text>&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <damagelist>
               <id-00001>
                  <type type="string"><xsl:value-of select='translate(@typetext, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz")' /></type>
                  <xsl:choose>
                     <xsl:when test='contains(@damage, "d4")'><xsl:text>&#13;</xsl:text>
                        <dice type="dice">d4</dice>
                        <bonus type="number"><xsl:value-of select='substring-after(substring-before(@damage, " "), "d4")' /></bonus>
                     </xsl:when>
                     <xsl:when test='contains(@damage, "d6")'><xsl:text>&#13;</xsl:text>
                        <dice type="dice">d6</dice>
                        <bonus type="number"><xsl:value-of select='substring-after(substring-before(@damage, " "), "d6")' /></bonus>
                     </xsl:when>
                     <xsl:when test='contains(@damage, "d8")'><xsl:text>&#13;</xsl:text>
                        <dice type="dice">d8</dice>
                        <bonus type="number"><xsl:value-of select='substring-after(substring-before(@damage, " "), "d8")' /></bonus>
                     </xsl:when>
                     <xsl:when test='contains(@damage, "d10")'><xsl:text>&#13;</xsl:text>
                        <dice type="dice">d10</dice>
                        <bonus type="number"><xsl:value-of select='substring-after(substring-before(@damage, " "), "d10")' /></bonus>
                     </xsl:when>
                     <xsl:when test='contains(@damage, "d12")'><xsl:text>&#13;</xsl:text>
                        <dice type="dice">d12</dice>
                        <bonus type="number"><xsl:value-of select='substring-after(substring-before(@damage, " "), "d12")' /></bonus>
                     </xsl:when>
                     <xsl:when test='contains(@damage, "d20")'><xsl:text>&#13;</xsl:text>
                        <dice type="dice">d20</dice>
                        <bonus type="number"><xsl:value-of select='substring-after(substring-before(@damage, " "), "d20")' /></bonus>
                     </xsl:when>
                  </xsl:choose>
               </id-00001>
            </damagelist>
            <properties type="string"><xsl:value-of select="wepproperty" /></properties><xsl:text>&#13;</xsl:text>
            <!-- Type: 0-Melee; 1-Ranged; 2-Thrown -->
            <xsl:choose>
               <xsl:when test="rangedattack">
                  <xsl:choose>
                     <xsl:when test="@categorytext='Projectile Weapon'">
                        <type type="number">1</type><xsl:text>&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <type type="number">2</type><xsl:text>&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:when>
               <xsl:otherwise>
                  <type type="number">0</type><xsl:text>&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <!-- Can we go through items to find reference? -->
            <xsl:for-each select="//document/public/character/gear/item">
               <xsl:choose>
               <xsl:when test='@name=$thiswepname'>
                  <shortcut type="windowreference">
					<class>item</class>
               <xsl:choose>
                <xsl:when test="number(position()) &lt; 10">
					    <recordname>....inventorylist.id-0000<xsl:value-of select="position()" /></recordname>
                </xsl:when>
                <xsl:otherwise>
                   <recordname>....inventorylist.id-000<xsl:value-of select="position()" /></recordname>
                </xsl:otherwise>
                </xsl:choose>
				</shortcut>
               </xsl:when>
               </xsl:choose>
            </xsl:for-each> 
            <xsl:choose>
               <xsl:when test="number(position()) &lt; 10">
                  <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            </xsl:if>
         </xsl:for-each>
         </weaponlist><xsl:text>&#13;</xsl:text>
          <!-- Start WEAPONS -->
         
         <!-- Start COINS -->
         <coins><xsl:text>&#13;</xsl:text>
         <xsl:for-each select="document/public/character/money/coins">
            <xsl:text disable-output-escaping="yes">&lt;slot</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">>&#13;</xsl:text>
               <amount type="number"><xsl:value-of select="@count" /></amount><xsl:text>&#13;</xsl:text>
               <name type="string"><xsl:value-of select='translate(@abbreviation,"abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ")' /></name><xsl:text>&#13;</xsl:text>
            <xsl:text disable-output-escaping="yes">&lt;/slot</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">>&#13;</xsl:text>
         </xsl:for-each>
         </coins><xsl:text>&#13;</xsl:text>
         <!-- End COINS -->
         
         <!-- Start EXPERIENCE -->
         <xsl:variable name="currenthp" select="document/public/character/xp/@total" />
         <exp type="number"><xsl:value-of select="$currenthp" /></exp>
         <xsl:choose>
            <xsl:when test='$currenthp &lt; 300' >
               <expneeded type="number">300</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 900' >
               <expneeded type="number">900</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 2700' >
               <expneeded type="number">2700</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 6500' >
               <expneeded type="number">6500</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 14000' >
               <expneeded type="number">14000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 23000' >
               <expneeded type="number">23000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 34000' >
               <expneeded type="number">34000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 48000' >
               <expneeded type="number">48000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 64000' >
               <expneeded type="number">64000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 85000' >
               <expneeded type="number">85000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 100000' >
               <expneeded type="number">100000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 120000' >
               <expneeded type="number">120000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 140000' >
               <expneeded type="number">140000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 165000' >
               <expneeded type="number">165000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 195000' >
               <expneeded type="number">195000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 225000' >
               <expneeded type="number">225000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 265000' >
               <expneeded type="number">265000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 305000' >
               <expneeded type="number">305000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
            <xsl:when test='$currenthp &lt; 355000' >
               <expneeded type="number">355000</expneeded><xsl:text>&#13;</xsl:text>
            </xsl:when>
         </xsl:choose>
         <!-- End EXPERIENCE -->
         
         <!-- Start PROFICIENCIES -->
         <proficiencylist><xsl:text>&#13;</xsl:text>
         <xsl:for-each select="document/public/character/toolproficiencies | document/public/character/weaponproficiencies | document/public/character/armorproficiencies">
            <xsl:if test="@text!=''">
            <xsl:choose>
               <xsl:when test="number(position()) &lt; 10">
                  <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            <name type="string"><xsl:value-of select='@text' /></name><xsl:text>&#13;</xsl:text>
            <xsl:choose>
               <xsl:when test="number(position()) &lt; 10">
                  <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
               </xsl:otherwise>
            </xsl:choose>
            </xsl:if>
         </xsl:for-each>
		   </proficiencylist><xsl:text>&#13;</xsl:text>
         <!-- End PROFICIENCIES -->
         
         <!-- Start FEATURE LIST -->
         <featurelist><xsl:text>&#13;</xsl:text>
            <xsl:for-each select="document/public/character/otherspecials/special">
               <xsl:choose>
               <xsl:when test='specsource="Fighter"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Barbarian"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Bard"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Cleric"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Druid"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Monk"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Paladin"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Ranger"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Rogue"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Sorcerer"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Warlock"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select='translate(@name, "&#8217;", "&#39;")' /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Wizard"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <!--<xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>-->
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>  
               <xsl:when test='specsource="Acolyte"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Charlatan"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Criminal"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Entertainer"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Folk Hero"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Gladiator"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Guild Artisan"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Guild Merchant"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Hermit"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Noble"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Noble Knight"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Outlander"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Pirate"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Sage"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Sailor"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Soldier"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Spy"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>
               <xsl:when test='specsource="Urchin"'>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                  <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                  <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                     <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                  </text><xsl:text>&#13;</xsl:text>
                  <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                  <xsl:choose>
                     <xsl:when test="number(position()) &lt; 10">
                        <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>  
               </xsl:when>               
            </xsl:choose>
         </xsl:for-each>
         </featurelist><xsl:text>&#13;</xsl:text>
         <!-- End FEATURE LIST -->
         
         <!-- Start TRAIT LIST -->
         <traitlist><xsl:text>&#13;</xsl:text>
            <xsl:for-each select="document/public/character/otherspecials/special">
               <xsl:choose>
                  <xsl:when test='specsource="Dragonborn"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Dwarf"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Elf"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Dark Elf (Drow)"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Wood Elf"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="High Elf"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Gnome"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Rock Gnome"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                   <xsl:when test='specsource="Forest Gnome"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Half-Elf"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Half-Orc"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Halfling"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Stout Halfling"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Lightfoot"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Human"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:when test='specsource="Tiefling"'>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>
                     <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                     <source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>
                     <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                        <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                     </text><xsl:text>&#13;</xsl:text>
                     <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                     <type type="string">racial</type>
                     <xsl:choose>
                        <xsl:when test="number(position()) &lt; 10">
                           <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                        </xsl:otherwise>
                     </xsl:choose>  
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:if test='not(specsource)'>
                        <xsl:choose>
                           <xsl:when test="number(position()) &lt; 10">
                              <xsl:text disable-output-escaping="yes">&lt;id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&lt;id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                        <name type="string"><xsl:value-of select="@name" /></name><xsl:text>&#13;</xsl:text>
                        <!--<source type="string"><xsl:value-of select="@specsource" /></source><xsl:text>&#13;</xsl:text>-->
                        <text type="formattedtext"><xsl:text>&#13;</xsl:text>
                           <xsl:value-of select='translate(description, "&#8217;&#8212;", "&#39;-")' /><xsl:text>&#13;</xsl:text>
                        </text><xsl:text>&#13;</xsl:text>
                        <locked type="number">1</locked><xsl:text>&#13;</xsl:text>
                        <type type="string">racial</type>
                        <xsl:choose>
                           <xsl:when test="number(position()) &lt; 10">
                              <xsl:text disable-output-escaping="yes">&lt;/id-0000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:text disable-output-escaping="yes">&lt;/id-000</xsl:text><xsl:value-of select="position()" /><xsl:text disable-output-escaping="yes">&gt;&#13;</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </xsl:if>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:for-each>
         </traitlist><xsl:text>&#13;</xsl:text>
         <!-- End TRAIT LIST -->
         
         <!-- Start DEFENSES -->
         <defenses><xsl:text>&#13;</xsl:text>
            <ac><xsl:text>&#13;</xsl:text>
               <xsl:for-each select="document/public/character/armorclass">
                  <armor type="number"><xsl:value-of select="@fromarmor" /></armor><xsl:text>&#13;</xsl:text>
                  <shield type="number"><xsl:value-of select="@fromshield" /></shield><xsl:text>&#13;</xsl:text>
                  <xsl:for-each select="//document/public/character/defenses/armor">
                     <xsl:if test='@equipped="yes"'>
                        <xsl:if test='@stealth="Disadvantage"'>
                           <disstealth type="number">1</disstealth><xsl:text>&#13;</xsl:text>
                        </xsl:if>
                        <xsl:if test='not(@isproficient)'>
                           <prof type="number">0</prof><xsl:text>&#13;</xsl:text>
                        </xsl:if>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:choose>
                     <!-- DEXBONUS: None='no', Max 3='max3', Max 2='max2', Full= no entry for this -->
                     <xsl:when test='@maxdexbonus="2"'>
                        <dexbonus type="string">max2</dexbonus><xsl:text>&#13;</xsl:text>
                     </xsl:when>
                     <xsl:when test='@maxdexbonus="3"'>
                        <dexbonus type="string">max3</dexbonus><xsl:text>&#13;</xsl:text>
                     </xsl:when>
                     <xsl:when test='@maxdexbonus="99999"'>
                        <dexbonus type="string"></dexbonus><xsl:text>&#13;</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <dexbonus type="string">no</dexbonus><xsl:text>&#13;</xsl:text>
                     </xsl:otherwise>
                  </xsl:choose>
                  <misc type="number"><xsl:value-of select="@frommisc" /></misc><xsl:text>&#13;</xsl:text>
               </xsl:for-each>
            </ac><xsl:text>&#13;</xsl:text>
         </defenses><xsl:text>&#13;</xsl:text>
         <!-- End DEFENSES -->
         
         <!-- Start SPEED -->
         <speed>
            <base type="number"><xsl:value-of select="document/public/character/movement/basespeed/@value" /></base><xsl:text>&#13;</xsl:text>
         </speed>
         
         <!-- Start ADVENTURER'S LEAGUE -->
         <dci type="string"><xsl:value-of select='document/public/character/adventurersleague/@playernum' /></dci>
         <faction type="string">
            <xsl:for-each select="document/public/character/factions/faction/@name" >
               <xsl:if test="position() > 1 ">, </xsl:if>                       
                  <xsl:value-of select="." />
            </xsl:for-each>        
         </faction>
         
         <!-- Start APPEARANCE -->
         <appearance type="string">
            <xsl:for-each select='document/public/character/personal/@*'>
               <xsl:value-of select='concat(translate(name(), "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ"), ": ", ., "\n")' />
            </xsl:for-each>
         </appearance>
         
         
    </character><xsl:text>&#13;</xsl:text>
  </root>
  </xsl:template>
</xsl:stylesheet>
