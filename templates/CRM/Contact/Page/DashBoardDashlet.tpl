{*
 +--------------------------------------------------------------------+
 | CiviCRM version 4.5                                                |
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC (c) 2004-2014                                |
 +--------------------------------------------------------------------+
 | This file is a part of CiviCRM.                                    |
 |                                                                    |
 | CiviCRM is free software; you can copy, modify, and distribute it  |
 | under the terms of the GNU Affero General Public License           |
 | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
 |                                                                    |
 | CiviCRM is distributed in the hope that it will be useful, but     |
 | WITHOUT ANY WARRANTY; without even the implied warranty of         |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
 | See the GNU Affero General Public License for more details.        |
 |                                                                    |
 | You should have received a copy of the GNU Affero General Public   |
 | License and the CiviCRM Licensing Exception along                  |
 | with this program; if not, contact CiviCRM LLC                     |
 | at info[AT]civicrm[DOT]org. If you have questions about the        |
 | GNU Affero General Public License or the licensing of CiviCRM,     |
 | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
 +--------------------------------------------------------------------+
*}
{include file="CRM/common/dashboard.tpl"}
{include file="CRM/common/openFlashChart.tpl"}
{* Alerts for critical configuration settings. *}
{if ! $fromEmailOK || ! $ownerOrgOK || ! $defaultMailboxOK}
    <div class="help">
    <div class="finalconf-intro form-group">
      {ts}There are a few things to setup before using your site ...{/ts}
    </div>
    {if ! $ownerOrgOK}
        <div class="panel panel-info">
        <div class="panel-heading finalconf-item"> <div class="icon alert-icon"></div> &nbsp;{ts}Organization Name{/ts}</div>
        <div class="panel-body finalconf-itemdesc"><div class="col-sm-6">{ts}Please enter your organization's name and primary address.{/ts}</div>
        <div class="col-sm-2 col-sm-offset-4 finalconf-button">
            <a href="{$fixOrgUrl}" id="fixOrgUrl" class="btn btn-info button"><span><div class="icon settings-icon"></div>{ts}Go{/ts}</span></a>
        </div>
        </div>
        </div>
       <div style="clear:both"></div>
  {/if}
    {if ! $fromEmailOK}
        <div class="panel panel-info">
        <div class="panel-heading finalconf-item"><div class="icon alert-icon"></div> &nbsp;{ts}From Email Address{/ts}</div>
        <div class="panel-body finalconf-itemdesc"><div class="col-sm-6">{ts}Please enter a default FROM Email Address (for system-generated emails).{/ts}</div>
        <div class="col-sm-2 col-sm-offset-4 finalconf-button">
            <a href="{$fixEmailUrl}" id="fixOrgUrl" class="btn btn-info button"><span><div class="icon settings-icon"></div>{ts}Go{/ts}</span></a>
        </div>
        </div>
        </div>
      <div style="clear:both"></div>
    {/if}
    {if ! $defaultMailboxOK}
        <div class="panel panel-info"> 
        <div class="panel-heading finalconf-item"><div class="icon alert-icon"></div> &nbsp;{ts}Default CiviMail Mailbox{/ts}</div>
        <div class="panel-body finalconf-itemdesc"><div class="col-sm-6">{ts}Please configure a default mailbox for CiviMail.{/ts} (<a href="http://book.civicrm.org/user/advanced-configuration/email-system-configuration/" title="{ts}opens online user guide in a new window{/ts}" target="_blank">{ts}learn more{/ts}</a>)</div>
        <div class="col-sm-2 col-sm-offset-4 finalconf-button">
            <a href="{$fixDefaultMailbox}" id="fixDefaultMailbox" class="btn btn-info button"><span><div class="icon settings-icon"></div>{ts}Go{/ts}</span></a>
        </div>
        </div>
        </div>
       <div style="clear:both"></div>
    {/if}
    </div>
{/if}
{$communityMessages}
<div class="crm-submit-buttons">
<a href="#" id="crm-dashboard-configure" class="btn btn-info crm-hover-button show-add">
  <span class="icon settings-icon"></span> {ts}Configure Your Dashboard{/ts}
</a>

<a style="display:none;" href="{crmURL p="civicrm/dashboard" q="reset=1"}" class=" btn btn-info button show-done" style="margin-left: 6px;">
  <span><div class="icon check-icon"></div> {ts}Done{/ts}</span>
</a>

<a style="float:right;" href="{crmURL p="civicrm/dashboard" q="reset=1&resetCache=1"}" class=" btn btn-info crm-hover-button show-refresh" style="margin-left: 6px;">
  <span class="icon refresh-icon"></span> {ts}Refresh Dashboard Data{/ts}
</a>

</div>
<div class="form-group clear"></div>
<div class="crm-block crm-content-block">
{* Welcome message appears when there are no active dashlets for the current user. *}
<div id="empty-message" class='hiddenElement'>
    <div class="status">
        <div class=" form-group font-size12pt bold">{ts}Welcome to your Home Dashboard{/ts}</div>
        <div class="form-group display-block">
            {ts}Your dashboard provides a one-screen view of the data that's most important to you. Graphical or tabular data is pulled from the reports you select, and is displayed in 'dashlets' (sections of the dashboard).{/ts} {help id="id-dash_welcome" file="CRM/Contact/Page/Dashboard.hlp"}
        </div>
    </div>
</div>

<div id="configure-dashlet" class='hiddenElement'></div>
<div id="civicrm-dashboard">
  {* You can put anything you like here.  jQuery.dashboard() will remove it. *}
  <noscript>{ts}Javascript must be enabled in your browser in order to use the dashboard features.{/ts}</noscript>
</div>
<div class="clear"></div>
{literal}
<script type="text/javascript">
  CRM.$(function($) {
    $('#crm-dashboard-configure').click(function() {
      $.ajax({
         url: CRM.url('civicrm/dashlet', 'reset=1&snippet=1'),
         success: function( content ) {
           $("#civicrm-dashboard, #crm-dashboard-configure, .show-refresh, #empty-message").hide();
           $('.show-done').show();
           $("#configure-dashlet").show().html(content).trigger('crmLoad');
         }
      });
      return false;
    });
  });
</script>
{/literal}
</div>
