# Linkedin AdBlock Filter
> tested for ublock origin

```inkedin.com#?#.feed-shared-update:-abp-contains(Promoted)
linkedin.com##.ad-banner
linkedin.com#?#.feed-shared-update-v2:-abp-contains(Promoted)
linkedin.com##iframe[src=”about:blank”]
linkedin.com##LI.linkedin-sponsor

# Block things on LinkedIn with uBlock Origin that LinkedIn won't let you block
# Choose "Options" in uBlock Origin with a right-click, and add these to
# "My filters"

# Courses
#linkedin.com##:xpath(.//div[contains(@data-id, 'urn:li:lyndaCourse')])

# Promoted posts 2020-02-24
#linkedin.com##xpath(.//span[contains(@class, 'feed-shared-actor__sub-description') and text()[contains(.,'Promoted')]]/../../../..)

# Sponsored posts (old version)
linkedin.com##:xpath(//*[(text()[contains(.,'Promoted')])]/../../../..)

# Events recommended for you 2021-09-24
#linkedin.com##:xpath(//*[(text()[contains(.,'Events recommended for you')])]/../../../../../../..)

# Add to your feed 2021-09-24
#linkedin.com##:xpath(//*[(text()[contains(.,'Add to your feed')])]/../../../../../../..)

# Courses & News 2021-09-24
#linkedin.com##:xpath(//*[(text()[contains(.,"Today’s top courses")])]/../../../..)

# Courses 2021-09-24
# linkedin.com##:xpath(//*[(text()[contains(.,"Today’s top courses")])]/../../..)

# News 2021-09-24
# linkedin.com##:xpath(//*[(text()[contains(.,"LinkedIn News")])]/../../..)


# Completely unrelated jobs that are always the exact opposite of your profile
#linkedin.com##:xpath(//*[(text()[contains(.,'Jobs recommended for you')])]/../../../../../../..)

# Facebook junk (no longer updated, I don't use facebook)

```